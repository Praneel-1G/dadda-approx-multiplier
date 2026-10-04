#!/usr/bin/env bash
set -euo pipefail

EXP_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT_ROOT="$(cd "$EXP_ROOT/../.." && pwd)"
# shellcheck disable=SC1091
source "$EXP_ROOT/experiment.env"

VCD="${1:-$EXP_ROOT/verification/rtl_activity.vcd}"
SCOPE="${2:-$RTL_SCOPE}"
[[ -f "$VCD" ]] || { echo "ERROR: missing VCD: $VCD" >&2; exit 1; }
command -v python3 >/dev/null 2>&1 || { echo "ERROR: python3 not found" >&2; exit 1; }

# Keep the stored report portable when using the default project VCD.
cd "$PROJECT_ROOT"
if [[ "$VCD" == "$EXP_ROOT/verification/rtl_activity.vcd" ]]; then
  VCD_ARG="${EXP_ROOT#$PROJECT_ROOT/}/verification/rtl_activity.vcd"
else
  VCD_ARG="$VCD"
fi

python3 "$PROJECT_ROOT/tools/vcd_metrics.py" \
  "$VCD_ARG" \
  --scope "$SCOPE" \
  --exact \
  --out "${EXP_ROOT#$PROJECT_ROOT/}/results/vcd_metrics.txt"
