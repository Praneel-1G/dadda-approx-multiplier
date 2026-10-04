#!/usr/bin/env python3
from __future__ import annotations
import csv, json, subprocess, sys
from pathlib import Path
ROOT = Path(__file__).resolve().parents[1]
EXP_ROOT = ROOT / "experiments"
OUT = ROOT / "reports"
OUT.mkdir(parents=True, exist_ok=True)
rows, failures = [], []
for exp_dir in sorted(p for p in EXP_ROOT.iterdir() if p.is_dir() and (p / "experiment.env").exists()):
    collector = exp_dir / "scripts" / "collect_results.sh"
    if collector.exists():
        try:
            subprocess.run([str(collector)], cwd=exp_dir / "scripts", check=True)
        except subprocess.CalledProcessError as exc:
            failures.append(f"{exp_dir.name}: collector exited {exc.returncode}")
            continue
    csv_path = exp_dir / "results" / "FINAL_METRICS.csv"
    if not csv_path.exists():
        failures.append(f"{exp_dir.name}: missing {csv_path}")
        continue
    with csv_path.open(newline="") as f:
        data = {r["metric"]: r["value"] for r in csv.DictReader(f)}
    data["experiment_dir"] = exp_dir.name
    rows.append(data)
fields = ["experiment_dir","experiment_id","design_name","platform","area","cell_count","period_min","fmax","critical_path_delay","wns","tns","setup_violations","hold_violations","timing_status","vcd_unique_pairs","vcd_error_count","power_no_vcd_mw","power_vcd_mw","power_vcd_minus_no_vcd_pct","pdp_no_vcd","pdp_vcd"]
with (OUT / "ALL_EXPERIMENTS_COMPARISON.csv").open("w", newline="") as f:
    w = csv.DictWriter(f, fieldnames=fields); w.writeheader(); w.writerows({k:r.get(k,"") for k in fields} for r in rows)
lines = ["# All Experiments — Final Research Comparison","","> Generated from each experiment's `results/FINAL_METRICS.csv`. Power columns keep No-VCD/vectorless and VCD-driven methodology separate.","","| Experiment | Design | Area (µm²) | Fmax (MHz) | Critical delay (ns) | WNS (ns) | TNS (ns) | Timing | No-VCD power (mW) | VCD power (mW) | VCD power change | PDP No-VCD (pJ) | PDP VCD (pJ) |","|---|---|---:|---:|---:|---:|---:|---|---:|---:|---:|---:|---:|"]
for r in rows:
    lines.append(f"| {r.get('experiment_id','')} | {r.get('design_name','')} | {r.get('area','')} | {r.get('fmax','')} | {r.get('critical_path_delay','')} | {r.get('wns','')} | {r.get('tns','')} | {r.get('timing_status','')} | {r.get('power_no_vcd_mw','')} | {r.get('power_vcd_mw','')} | {r.get('power_vcd_minus_no_vcd_pct','')}% | {r.get('pdp_no_vcd','')} | {r.get('pdp_vcd','')} |")
lines += ["","## Interpretation rules","","- Timing is determined from the ORFS finish report; negative WNS means the configured target period is not met.","- No-VCD power is the ORFS finish-stage `report_power` result without final gate-VCD activity annotation.","- VCD power is the post-ORFS OpenROAD result after `read_vcd` annotation from `gate_activity.vcd`.","- Do not rank architectures using one power methodology for one experiment and the other methodology for another.",""]
if failures: lines += ["## Collection warnings",""] + [f"- {x}" for x in failures] + [""]
else: lines += ["## Collection status","","All discovered experiment summaries were collected successfully.",""]
(OUT / "ALL_EXPERIMENTS_FINAL_SUMMARY.md").write_text("\n".join(lines))
(OUT / "ALL_EXPERIMENTS_COMPARISON.json").write_text(json.dumps({"experiments":rows,"warnings":failures}, indent=2)+"\n")
print(f"Wrote: {OUT / 'ALL_EXPERIMENTS_FINAL_SUMMARY.md'}")
print(f"Wrote: {OUT / 'ALL_EXPERIMENTS_COMPARISON.csv'}")
print(f"Wrote: {OUT / 'ALL_EXPERIMENTS_COMPARISON.json'}")
if failures:
    print("Warnings:"); [print(f"  - {x}") for x in failures]
    sys.exit(2)
