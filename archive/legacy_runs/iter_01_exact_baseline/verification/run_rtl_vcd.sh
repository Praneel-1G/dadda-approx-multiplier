#!/usr/bin/env bash
set -euo pipefail

# ------------------------------------------------------------
# Simple RTL simulation + VCD generation
# Project layout assumed:
#   project/
#   ├── src/
#   └── runs/iter_01_exact_baseline/verification/
#
# Put this script in:
#   runs/iter_01_exact_baseline/verification/run_rtl_vcd.sh
# ------------------------------------------------------------

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"

TB="$SCRIPT_DIR/tb_exact_dadda_without_compressor.sv"
VVP="$SCRIPT_DIR/sim_no_comp.vvp"
VCD="$SCRIPT_DIR/activity_no_comp.vcd"

SRC_DIR="$PROJECT_ROOT/src"

echo "=============================================="
echo " RTL SIMULATION: Dadda WITHOUT COMPRESSOR"
echo "=============================================="

# Check required tools/files
command -v iverilog >/dev/null 2>&1 || {
    echo "ERROR: iverilog is not installed or not in PATH."
    exit 1
}

command -v vvp >/dev/null 2>&1 || {
    echo "ERROR: vvp is not installed or not in PATH."
    exit 1
}

for f in \
    "$TB" \
    "$SRC_DIR/exact/exact_dadda_no_comp.sv" \
    "$SRC_DIR/common/fa.sv" \
    "$SRC_DIR/common/ha.sv" \
    "$SRC_DIR/common/input_reorder.sv"
do
    if [[ ! -f "$f" ]]; then
        echo "ERROR: Missing file:"
        echo "  $f"
        exit 1
    fi
done

# Remove old simulation outputs so the result is always fresh.
rm -f "$VVP" "$VCD"

echo "[1/2] Compiling..."

iverilog -g2012 \
    -s tb_exact_dadda_without_compressor \
    -o "$VVP" \
    "$SRC_DIR/common/fa.sv" \
    "$SRC_DIR/common/ha.sv" \
    "$SRC_DIR/common/input_reorder.sv" \
    "$SRC_DIR/exact/exact_dadda_no_comp.sv" \
    "$TB"

echo "[2/2] Running simulation..."

# The testbench uses a relative $dumpfile(...) path.
# Run vvp from verification/ so the VCD is created here.
cd "$SCRIPT_DIR"
vvp "$VVP"

echo
echo "=============================================="
echo " SIMULATION FINISHED"
echo "=============================================="

if [[ -f "$VCD" ]]; then
    echo "VCD generated:"
    echo "  $VCD"
    echo
    ls -lh "$VCD"
else
    echo "ERROR: VCD was not generated."
    exit 1
fi