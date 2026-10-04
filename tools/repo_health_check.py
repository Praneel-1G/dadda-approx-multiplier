#!/usr/bin/env python3
"""Static consistency checks for the active experiment repository."""
from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
ACTIVE = [
    ROOT / "experiments/EXP000_exact_dadda_no_comp",
    ROOT / "experiments/EXP001_exact_dadda_4to2_comp",
]

errors = []
for exp in ACTIVE:
    env = exp / "experiment.env"
    if not env.is_file():
        errors.append(f"missing manifest: {env}")
        continue
    text = env.read_text()
    required = ["EXPERIMENT_ID=", "DESIGN_NAME=", "TOP_MODULE=", "RTL_TB_MODULE=", "GATE_TB_MODULE=", "RTL_SOURCES=", "RTL_SCOPE=", "GATE_SCOPE=", "ORFS_DESIGN_PATH="]
    for key in required:
        if key not in text:
            errors.append(f"{env}: missing {key}")

    for script in (exp / "scripts").glob("*.sh"):
        if "ORFS_FLOW_DIR" in script.read_text() or "${{" in script.read_text():
            errors.append(f"legacy/broken shell syntax in {script}")
        if not (script.stat().st_mode & 0o111):
            errors.append(f"script is not executable: {script}")

    run_rtl = (exp / "scripts/run_rtl.sh").read_text()
    if 'iverilog -g2012 -s "$TOP_MODULE"' in run_rtl:
        errors.append(f"{exp}: run_rtl.sh incorrectly uses DUT TOP_MODULE as simulation top")
    if 'iverilog -g2012 -s "$RTL_TB_MODULE"' not in run_rtl:
        errors.append(f"{exp}: run_rtl.sh must use RTL_TB_MODULE as simulation top")

    gate = (exp / "scripts/generate_gate_vcd.sh").read_text()
    if 'iverilog -g2012 -s "$GATE_TB_MODULE"' not in gate:
        errors.append(f"{exp}: generate_gate_vcd.sh must use GATE_TB_MODULE as simulation top")

    tb = (exp / "verification/tb.sv").read_text()
    if 'rtl_activity.vcd' not in tb:
        errors.append(f"{exp}: RTL testbench does not write rtl_activity.vcd")
    if 'GATE_VERIFY_ERRORS' in tb:
        errors.append(f"{exp}: RTL testbench contains gate-level marker unexpectedly")

# Controlled physical-design settings must match.
configs = [(exp / "pd/config.mk").read_text() for exp in ACTIVE]
keys = ["PLATFORM", "CORE_UTILIZATION", "CORE_ASPECT_RATIO", "CORE_MARGIN", "PLACE_DENSITY"]
for key in keys:
    vals = []
    for text in configs:
        m = re.search(rf"^export\s+{re.escape(key)}\s*=\s*(.+)$", text, re.M)
        vals.append(m.group(1).strip() if m else "<missing>")
    if len(set(vals)) != 1:
        errors.append(f"controlled setting mismatch for {key}: {vals}")

# Source-ish files must not contain the old user's project root.
for p in list(ROOT.glob("experiments/EXP*/scripts/*.sh")) + list(ROOT.glob("experiments/EXP*/experiment.env")) + [ROOT / "RUN_ORDER.txt"]:
    text = p.read_text(errors="replace")
    if "/home/praneel/" in text or "/tmp/IDP_2_RESEARCH_READY" in text:
        errors.append(f"machine-specific path remains in {p}")

if errors:
    print("REPOSITORY HEALTH: FAIL")
    for e in errors:
        print(f"- {e}")
    sys.exit(1)

print("REPOSITORY HEALTH: PASS")
print("Active experiments are consistent with the canonical script contract.")
