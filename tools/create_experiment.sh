#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMPLATE="$ROOT/templates/EXPERIMENT_TEMPLATE"

usage() {
    echo "Usage: $0 EXP_ID METHOD_SLUG [DESIGN_NAME]" >&2
    echo "Example: $0 EXP002 approx_dadda approx_dadda_8x8" >&2
    exit 2
}

[[ $# -ge 2 ]] || usage

EXP_ID="$1"
METHOD_SLUG="$2"
DESIGN_NAME="${3:-$METHOD_SLUG}"

[[ "$EXP_ID" =~ ^EXP[0-9]{3}$ ]] || {
    echo "ERROR: EXP_ID must look like EXP002" >&2
    exit 1
}
[[ "$METHOD_SLUG" =~ ^[A-Za-z0-9_]+$ ]] || {
    echo "ERROR: METHOD_SLUG must contain only letters, digits and underscores" >&2
    exit 1
}
[[ "$DESIGN_NAME" =~ ^[A-Za-z0-9_]+$ ]] || {
    echo "ERROR: DESIGN_NAME should use letters, digits and underscores" >&2
    exit 1
}

[[ -d "$TEMPLATE" ]] || {
    echo "ERROR: experiment template not found: $TEMPLATE" >&2
    exit 1
}
[[ -d "$TEMPLATE/scripts" ]] || {
    echo "ERROR: template scripts directory not found: $TEMPLATE/scripts" >&2
    exit 1
}
[[ -f "$TEMPLATE/pd/constraint.sdc" ]] || {
    echo "ERROR: template constraint not found: $TEMPLATE/pd/constraint.sdc" >&2
    exit 1
}

EXP_DIR="$ROOT/experiments/${EXP_ID}_${METHOD_SLUG}"
[[ ! -e "$EXP_DIR" ]] || {
    echo "ERROR: experiment already exists: $EXP_DIR" >&2
    exit 1
}

mkdir -p "$EXP_DIR"/{scripts,verification,pd,results,notes}

# Copy the complete proven experiment script set, including result collection.
cp "$TEMPLATE/scripts/"*.sh "$EXP_DIR/scripts/"
cp "$TEMPLATE/pd/constraint.sdc" "$EXP_DIR/pd/constraint.sdc"

cat > "$EXP_DIR/experiment.env" <<EOF_ENV
# Experiment manifest.
# Keep this file portable: do not put machine-specific absolute paths here.

EXPERIMENT_ID=$EXP_ID
DESIGN_NAME=$DESIGN_NAME
TOP_MODULE=$DESIGN_NAME

# Update these two module names to the real testbench modules.
RTL_TB_MODULE=tb_${METHOD_SLUG}
GATE_TB_MODULE=tb_gate_${METHOD_SLUG}

# Space-separated RTL source paths, relative to the repository root.
# Example:
# RTL_SOURCES="rtl/exact/exact_dadda_w_comp.sv rtl/common/full_adder.sv"
RTL_SOURCES="rtl/REPLACE/source.sv"

PLATFORM=sky130hd
INPUT_WIDTH=8
OUTPUT_WIDTH=16
EXPECTED_VECTORS=65536

RTL_SCOPE=tb_${METHOD_SLUG}/dut
GATE_SCOPE=tb_gate_${METHOD_SLUG}/dut

# This must match the ORFS results path created by run_pd.sh.
ORFS_DESIGN_PATH=sky130hd/${DESIGN_NAME}/base

CLOCK_PERIOD_NS=2.000
EOF_ENV

cat > "$EXP_DIR/pd/config.mk" <<EOF_CFG
# Physical-design configuration for ${EXP_ID}_${METHOD_SLUG}.
# Keep controlled comparison settings identical unless the research question
# explicitly changes them.

export PLATFORM = sky130hd
export DESIGN_NAME = $DESIGN_NAME
export EXPERIMENT_ID = ${EXP_ID}_${METHOD_SLUG}

export RUN_DIR = \$(abspath \$(dir \$(DESIGN_CONFIG)))
export PROJECT_ROOT = \$(abspath \$(RUN_DIR)/../../..)

export VERILOG_FILES = \\
  \$(PROJECT_ROOT)/rtl/REPLACE/source.sv

export SDC_FILE = \$(RUN_DIR)/constraint.sdc

export CORE_UTILIZATION = 40
export CORE_ASPECT_RATIO = 1
export CORE_MARGIN = 2
export PLACE_DENSITY = 0.60
EOF_CFG

cat > "$EXP_DIR/README.md" <<EOF_README
# ${EXP_ID}_${METHOD_SLUG}

Experiment scaffold created by tools/create_experiment.sh.

## Before running

1. Put the new RTL under the shared rtl/ tree.
2. Set the exact RTL source list in experiment.env.
3. Set the real RTL testbench module in experiment.env.
4. Set the real gate testbench module in experiment.env.
5. Update RTL sources in pd/config.mk to match the exact synthesis sources.
6. Confirm RTL_SCOPE and GATE_SCOPE point to the DUT instances used in the VCDs.
7. Record what changed relative to EXP000 in notes/experiment.md.

## Canonical run

```bash
./scripts/run_rtl.sh
./scripts/check_vcd.sh
./scripts/run_pd.sh
./scripts/generate_gate_vcd.sh
export LIBERTY="\$OR_FLOW/platforms/sky130hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib"
./scripts/vcd_power.sh
./scripts/collect_results.sh
```

## Environment

ORFS is taken from `\$OR_FLOW` in the user's shell environment.
The exact Liberty/PVT corner is supplied through `\$LIBERTY` when running VCD power.
EOF_README

cat > "$EXP_DIR/notes/experiment.md" <<EOF_NOTES
# ${EXP_ID} — experiment notes

Research variable:

What changed relative to EXP000:

What stayed controlled/equal:

Expected effect:

RTL source files:

Testbench modules:

Target PVT:

Notes during run:
EOF_NOTES

chmod +x "$EXP_DIR/scripts"/*.sh

# Validate generated shell/config syntax where possible.
for f in "$EXP_DIR/scripts"/*.sh; do
    bash -n "$f"
done

printf 'Created: %s\n' "$EXP_DIR"
printf 'Next: edit %s/experiment.env and %s/pd/config.mk before running.\n' "$EXP_DIR" "$EXP_DIR"
printf 'Then run the scripts in canonical order from %s/scripts.\n' "$EXP_DIR"
