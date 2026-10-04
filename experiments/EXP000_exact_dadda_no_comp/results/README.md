# Experiment result evidence

This directory contains the canonical outputs of the experiment.

After the complete run succeeds, finish the experiment with:

```bash
../scripts/collect_results.sh
```

That creates:

- `FINAL_SUMMARY.md` — the human-readable final experiment summary.
- `final_artifacts/` — final netlist, SDC, SPEF, DEF, GDS, ODB, and RTL/gate VCDs.
- `final_reports/` — selected ORFS timing, routing, placement, CTS, synthesis, and visualization reports.
- `vcd_metrics.txt` — exact VCD verification metrics.
- `vcd_power.rpt` — canonical VCD-driven OpenROAD power report.
- `liberty_used.txt` — exact Liberty path when `LIBERTY` is set.

The collection script does not rerun the experiment. It only gathers the already-generated evidence and creates the final summary.
