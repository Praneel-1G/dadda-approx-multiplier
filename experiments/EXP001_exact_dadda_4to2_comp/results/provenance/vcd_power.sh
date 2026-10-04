#!/usr/bin/env bash
set -euo pipefail

EXP_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# shellcheck disable=SC1091
source "$EXP_ROOT/experiment.env"

: "${LIBERTY:?ERROR: LIBERTY must point to the exact Liberty/PVT corner used for the ORFS run}"
command -v openroad >/dev/null 2>&1 || { echo "ERROR: openroad not found" >&2; exit 1; }
[[ -f "$LIBERTY" ]] || { echo "ERROR: Liberty file not found: $LIBERTY" >&2; exit 1; }

R="$EXP_ROOT/pd/orfs/results/$ORFS_DESIGN_PATH"
FINAL_ODB="$R/6_final.odb"
FINAL_SDC="$R/6_final.sdc"
FINAL_SPEF="$R/6_final.spef"
VCD="$EXP_ROOT/verification/gate_activity.vcd"

for f in "$FINAL_ODB" "$FINAL_SDC" "$FINAL_SPEF" "$VCD"; do
  [[ -f "$f" ]] || { echo "ERROR: missing $f" >&2; exit 1; }
done

mkdir -p "$EXP_ROOT/results"
TCL="$EXP_ROOT/results/vcd_power.tcl"
OUT="$EXP_ROOT/results/vcd_power.rpt"
export LIBERTY

cat > "$TCL" <<'EOT'
set exp_root [file normalize [file join [file dirname [info script]] ..]]
set result_dir [file join $exp_root pd orfs results __ORFS_DESIGN_PATH__]
set final_odb [file join $result_dir 6_final.odb]
set final_sdc [file join $result_dir 6_final.sdc]
set final_spef [file join $result_dir 6_final.spef]
set vcd [file join $exp_root verification gate_activity.vcd]
set liberty $::env(LIBERTY)

read_liberty $liberty
read_db $final_odb
read_sdc $final_sdc
read_spef $final_spef
read_vcd -scope "__GATE_SCOPE__" $vcd

report_checks -path_delay max -digits 4
report_worst_slack -max -digits 4
report_tns -max -digits 4
report_power -digits 6

EOT

sed -i \
  -e "s#__ORFS_DESIGN_PATH__#$ORFS_DESIGN_PATH#g" \
  -e "s#__TOP_MODULE__#$TOP_MODULE#g" \
  -e "s#__GATE_SCOPE__#$GATE_SCOPE#g" \
  "$TCL"

openroad -no_init -exit "$TCL" 2>&1 | tee "$OUT"

grep -q 'Total' "$OUT" || { echo "ERROR: OpenROAD power report did not contain a Total power row" >&2; exit 1; }
echo "Power report saved to: $OUT"
