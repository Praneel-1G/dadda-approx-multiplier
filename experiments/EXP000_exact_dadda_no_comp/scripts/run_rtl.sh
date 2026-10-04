#!/usr/bin/env bash
set -euo pipefail

EXP_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT_ROOT="$(cd "$EXP_ROOT/../.." && pwd)"
# shellcheck disable=SC1091
source "$EXP_ROOT/experiment.env"

: "${TOP_MODULE:?TOP_MODULE is missing from experiment.env}"
: "${RTL_TB_MODULE:?RTL_TB_MODULE is missing from experiment.env}"
: "${EXPECTED_VECTORS:?EXPECTED_VECTORS is missing from experiment.env}"
: "${RTL_SOURCES:?RTL_SOURCES is missing from experiment.env}"

command -v iverilog >/dev/null 2>&1 || { echo "ERROR: iverilog not found" >&2; exit 1; }
command -v vvp >/dev/null 2>&1 || { echo "ERROR: vvp not found" >&2; exit 1; }

OUT="$EXP_ROOT/verification/rtl_sim.vvp"
VCD="$EXP_ROOT/verification/rtl_activity.vcd"
LOG="$EXP_ROOT/verification/rtl_sim.log"
TB="$EXP_ROOT/verification/tb.sv"

rm -f "$OUT" "$VCD" "$LOG"

# IMPORTANT: the testbench is the simulation top, not TOP_MODULE.
read -r -a RTL_FILES <<< "$RTL_SOURCES"
RTL_INPUTS=()
for rel in "${RTL_FILES[@]}"; do
  RTL_INPUTS+=("$PROJECT_ROOT/$rel")
done

iverilog -g2012 -s "$RTL_TB_MODULE" -o "$OUT" \
  "${RTL_INPUTS[@]}" \
  "$TB" 2>&1 | tee "$LOG"

(
  cd "$EXP_ROOT/verification"
  vvp "$(basename "$OUT")"
) 2>&1 | tee -a "$LOG"

test -s "$VCD" || {
  echo "ERROR: RTL VCD was not generated: $VCD" >&2
  echo 'The testbench must call $dumpfile("rtl_activity.vcd").' >&2
  exit 1
}

grep -q "RTL_VERIFY_ERRORS=0" "$LOG" || {
  echo "ERROR: RTL verification did not report zero errors" >&2
  exit 1
}

grep -q "RTL_VERIFY_VECTORS=$EXPECTED_VECTORS" "$LOG" || {
  echo "ERROR: RTL verification did not run exactly $EXPECTED_VECTORS vectors" >&2
  exit 1
}

echo "RTL verification PASS: $EXPECTED_VECTORS vectors"
echo "Generated: $VCD"
