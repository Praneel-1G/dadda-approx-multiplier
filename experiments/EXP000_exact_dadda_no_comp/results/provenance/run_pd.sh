#!/usr/bin/env bash
set -euo pipefail

EXP_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# shellcheck disable=SC1091
source "$EXP_ROOT/experiment.env"

: "${OR_FLOW:?ERROR: OR_FLOW must be set in the environment and point to the OpenROAD-flow-scripts/flow directory}"
[[ -f "$OR_FLOW/Makefile" ]] || { echo "ERROR: OR_FLOW does not contain Makefile: $OR_FLOW" >&2; exit 1; }

CONFIG="$EXP_ROOT/pd/config.mk"
WORK_HOME="$EXP_ROOT/pd/orfs"
mkdir -p "$WORK_HOME"

make --file="$OR_FLOW/Makefile" \
  DESIGN_CONFIG="$CONFIG" \
  WORK_HOME="$WORK_HOME"

echo "ORFS complete: $WORK_HOME/results/$ORFS_DESIGN_PATH"
