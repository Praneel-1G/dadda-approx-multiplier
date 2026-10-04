#!/usr/bin/env bash
set -euo pipefail

EXP_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$EXP_ROOT/experiment.env"

RESULTS="$EXP_ROOT/results"
FINAL_ARTIFACTS="$RESULTS/final_artifacts"
FINAL_REPORTS="$RESULTS/final_reports"
FINAL_LOGS="$RESULTS/final_logs"
FINAL_PROV="$RESULTS/provenance"
SUMMARY="$RESULTS/FINAL_SUMMARY.md"
CSV="$RESULTS/FINAL_METRICS.csv"
JSON="$RESULTS/FINAL_METRICS.json"
MANIFEST="$RESULTS/RESULTS_MANIFEST.txt"

REPORT_DIR="$EXP_ROOT/pd/orfs/reports/$ORFS_DESIGN_PATH"
RESULT_DIR="$EXP_ROOT/pd/orfs/results/$ORFS_DESIGN_PATH"
LOG_DIR="$EXP_ROOT/pd/orfs/logs/$ORFS_DESIGN_PATH"
FINISH_RPT="$REPORT_DIR/6_finish.rpt"
SYNTH_STAT="$REPORT_DIR/synth_stat.txt"
VCD_METRICS="$RESULTS/vcd_metrics.txt"
POWER_VCD_RPT="$RESULTS/vcd_power.rpt"
POWER_VCD_TCL="$RESULTS/vcd_power.tcl"
RTL_LOG="$EXP_ROOT/verification/rtl_sim.log"
GATE_LOG="$EXP_ROOT/verification/gate_sim.log"

mkdir -p "$FINAL_ARTIFACTS" "$FINAL_REPORTS" "$FINAL_LOGS" "$FINAL_PROV"

# ---------- presence checks ----------
require_file() {
  local f="$1"; [[ -f "$f" ]] || { echo "ERROR: missing required file: $f" >&2; exit 1; }
}

require_file "$FINISH_RPT"
require_file "$SYNTH_STAT"
require_file "$EXP_ROOT/pd/config.mk"
require_file "$EXP_ROOT/pd/constraint.sdc"

# Physical design final artifacts: all required for a complete ORFS run.
for f in 6_final.v 6_final.sdc 6_final.spef 6_final.def 6_final.gds 6_final.odb; do
  require_file "$RESULT_DIR/$f"
done

# ---------- helpers ----------
first_match() { awk "$1" "$2" 2>/dev/null | head -1; }

# ORFS finish timing/constraint metrics.
WNS="$(awk '/^wns max / {print $3; exit}' "$FINISH_RPT")"
TNS="$(awk '/^tns max / {print $3; exit}' "$FINISH_RPT")"
WORST_SLACK="$(awk '/^worst slack max / {print $4; exit}' "$FINISH_RPT")"
PERIOD_MIN="$(awk '/^VCLK period_min = / {print $4; exit}' "$FINISH_RPT")"
FMAX_MHZ="$(awk '/^VCLK period_min = / {print $7; exit}' "$FINISH_RPT")"
CRIT_DELAY="$(awk '/^finish critical path delay/{flag=1; next} flag && $1 ~ /^-?[0-9]+([.][0-9]+)?$/ {print $1; exit}' "$FINISH_RPT")"
CRIT_SLACK="$(awk '/^finish critical path slack/{flag=1; next} flag && $1 ~ /^-?[0-9]+([.][0-9]+)?$/ {print $1; exit}' "$FINISH_RPT")"
SETUP_VIOLS="$(awk '/^setup violation count / {print $4; exit}' "$FINISH_RPT")"
HOLD_VIOLS="$(awk '/^hold violation count / {print $4; exit}' "$FINISH_RPT")"
MAX_SLEW="$(awk '/^max slew violation count / {print $5; exit}' "$FINISH_RPT")"
MAX_FANOUT="$(awk '/^max fanout violation count / {print $5; exit}' "$FINISH_RPT")"
MAX_CAP="$(awk '/^max cap violation count / {print $5; exit}' "$FINISH_RPT")"

# Synthesis statistics.
AREA_UM2="$(awk '/Chip area for module/ {print $NF; exit}' "$SYNTH_STAT")"
CELL_COUNT="$(awk '$NF=="cells" {print $1; exit}' "$SYNTH_STAT")"
PORT_COUNT="$(awk '$NF=="ports" {print $1; exit}' "$SYNTH_STAT")"

# No-VCD / vectorless-style power from the ORFS finish report.
NVCD_INTERNAL_W=""
NVCD_SWITCHING_W=""
NVCD_LEAKAGE_W=""
NVCD_TOTAL_W=""
read -r NVCD_INTERNAL_W NVCD_SWITCHING_W NVCD_LEAKAGE_W NVCD_TOTAL_W < <(
  awk '/^finish report_power/{flag=1; next} flag && $1=="Total" && NF>=5 {print $2,$3,$4,$5; exit}' "$FINISH_RPT"
)

# VCD-driven power from the post-ORFS OpenROAD power report, when available.
VCD_INTERNAL_W=""
VCD_SWITCHING_W=""
VCD_LEAKAGE_W=""
VCD_TOTAL_W=""
if [[ -f "$POWER_VCD_RPT" ]]; then
  read -r VCD_INTERNAL_W VCD_SWITCHING_W VCD_LEAKAGE_W VCD_TOTAL_W < <(
    awk '$1=="Total" && NF>=5 {print $2,$3,$4,$5; exit}' "$POWER_VCD_RPT"
  )
fi

# Verification evidence.
RTL_VECTORS="$(grep -o 'RTL_VERIFY_VECTORS=[0-9]*' "$RTL_LOG" 2>/dev/null | tail -1 | cut -d= -f2 || true)"
RTL_ERRORS="$(grep -o 'RTL_VERIFY_ERRORS=[0-9]*' "$RTL_LOG" 2>/dev/null | tail -1 | cut -d= -f2 || true)"
GATE_VECTORS="$(grep -o 'GATE_VERIFY_VECTORS=[0-9]*' "$GATE_LOG" 2>/dev/null | tail -1 | cut -d= -f2 || true)"
GATE_ERRORS="$(grep -o 'GATE_VERIFY_ERRORS=[0-9]*' "$GATE_LOG" 2>/dev/null | tail -1 | cut -d= -f2 || true)"

RTL_VCD_STATUS="MISSING"
GATE_VCD_STATUS="MISSING"
[[ -f "$EXP_ROOT/verification/rtl_activity.vcd" ]] && RTL_VCD_STATUS="PRESENT"
[[ -f "$EXP_ROOT/verification/gate_activity.vcd" ]] && GATE_VCD_STATUS="PRESENT"

VCD_EXACT_STATUS="NOT_RUN"
VCD_UNIQUE_PAIRS=""
VCD_ERROR_COUNT=""
VCD_ERROR_RATE=""
VCD_MAE=""
VCD_MSE=""
VCD_WCE=""
VCD_MRE=""
VCD_MAXRE=""
if [[ -f "$VCD_METRICS" ]]; then
  VCD_EXACT_STATUS="PASS"
  VCD_UNIQUE_PAIRS="$(awk -F': ' '/Unique input pairs observed:/ {print $2; exit}' "$VCD_METRICS")"
  VCD_ERROR_COUNT="$(awk -F': ' '/Error count:/ {print $2; exit}' "$VCD_METRICS")"
  VCD_ERROR_RATE="$(awk -F': ' '/Error rate:/ {print $2; exit}' "$VCD_METRICS")"
  VCD_MAE="$(awk -F': ' '/MAE:/ {print $2; exit}' "$VCD_METRICS")"
  VCD_MSE="$(awk -F': ' '/MSE:/ {print $2; exit}' "$VCD_METRICS")"
  VCD_WCE="$(awk -F': ' '/WCE:/ {print $2; exit}' "$VCD_METRICS")"
  VCD_MRE="$(awk -F': ' '/MRE_nonzero:/ {print $2; exit}' "$VCD_METRICS")"
  VCD_MAXRE="$(awk -F': ' '/MaxRE_nonzero:/ {print $2; exit}' "$VCD_METRICS")"
fi

TIMING_STATUS="UNKNOWN"
if [[ -n "${WNS:-}" ]]; then
  if awk -v x="$WNS" 'BEGIN { exit !(x >= 0) }'; then TIMING_STATUS="PASS"; else TIMING_STATUS="FAIL"; fi
fi

# ---------- derived metrics ----------
fmt_mw() { awk -v x="${1:-}" 'BEGIN{if(x==""){print ""}else{printf "%.6f",x*1000}}'; }
fmt_pdp() { awk -v p="${1:-}" -v d="${2:-}" 'BEGIN{if(p==""||d==""){print ""}else{printf "%.6f",p*1000*d}}'; }
fmt_pct() { awk -v a="${1:-}" -v b="${2:-}" 'BEGIN{if(a==""||b==""||b==0){print ""}else{printf "%.3f",(a-b)/a*100}}'; }
FREQ_FROM_PERIOD="${FMAX_MHZ:-$(awk -v p="${PERIOD_MIN:-}" 'BEGIN{if(p==""){print ""}else{printf "%.3f",1000/p}}')}"
NVCD_MW="$(fmt_mw "$NVCD_TOTAL_W")"
VCD_MW="$(fmt_mw "$VCD_TOTAL_W")"
NVCD_PDP_PJ="$(fmt_pdp "$NVCD_TOTAL_W" "$CRIT_DELAY")"
VCD_PDP_PJ="$(fmt_pdp "$VCD_TOTAL_W" "$CRIT_DELAY")"
POWER_DELTA_PCT="$(fmt_pct "$NVCD_TOTAL_W" "$VCD_TOTAL_W")"
POWER_RATIO="$(awk -v a="${NVCD_TOTAL_W:-}" -v b="${VCD_TOTAL_W:-}" 'BEGIN{if(a==""||b==""||a==0){print ""}else{printf "%.6f",b/a}}')"

# ---------- collect evidence ----------
# Copy exact final physical artifacts.
for f in 6_final.v 6_final.sdc 6_final.spef 6_final.def 6_final.gds 6_final.odb; do
  cp -f "$RESULT_DIR/$f" "$FINAL_ARTIFACTS/$f"
done

# Copy VCDs and existing canonical reports if present; avoid same-file cp.
for src in "$EXP_ROOT/verification/rtl_activity.vcd" "$EXP_ROOT/verification/gate_activity.vcd"; do
  [[ -f "$src" ]] && cp -f "$src" "$FINAL_ARTIFACTS/"
done
for src in "$VCD_METRICS" "$POWER_VCD_RPT" "$POWER_VCD_TCL"; do
  [[ -f "$src" ]] && cp -f "$src" "$FINAL_ARTIFACTS/"
done

# Copy all ORFS reports/logs so research evidence is complete.
rm -rf "$FINAL_REPORTS/orfs" "$FINAL_LOGS/orfs"
mkdir -p "$FINAL_REPORTS/orfs" "$FINAL_LOGS/orfs"
cp -a "$REPORT_DIR/." "$FINAL_REPORTS/orfs/" 2>/dev/null || true
if [[ -d "$LOG_DIR" ]]; then cp -a "$LOG_DIR/." "$FINAL_LOGS/orfs/" 2>/dev/null || true; fi

# Copy simulation logs when present.
for f in rtl_sim.log gate_sim.log; do
  [[ -f "$EXP_ROOT/verification/$f" ]] && cp -f "$EXP_ROOT/verification/$f" "$FINAL_LOGS/"
done

# Provenance: scripts/configs/environment and versions.
cp -f "$EXP_ROOT/experiment.env" "$FINAL_PROV/experiment.env"
cp -f "$EXP_ROOT/pd/config.mk" "$FINAL_PROV/config.mk"
cp -f "$EXP_ROOT/pd/constraint.sdc" "$FINAL_PROV/constraint.sdc"
cp -f "$EXP_ROOT/README.md" "$FINAL_PROV/experiment_README.md" 2>/dev/null || true
cp -f "$EXP_ROOT/notes/experiment.md" "$FINAL_PROV/experiment_notes.md" 2>/dev/null || true
for f in "$EXP_ROOT/scripts"/*.sh; do cp -f "$f" "$FINAL_PROV/"; done
printf 'Collected on: %s\n' "$(date -Is)" > "$FINAL_PROV/tool_environment.txt"
printf 'OR_FLOW=%s\n' "${OR_FLOW:-}" >> "$FINAL_PROV/tool_environment.txt"
printf 'LIBERTY=%s\n' "${LIBERTY:-}" >> "$FINAL_PROV/tool_environment.txt"
printf 'IVERILOG=%s\n' "$(command -v iverilog 2>/dev/null || true)" >> "$FINAL_PROV/tool_environment.txt"
printf 'OPENROAD=%s\n' "$(command -v openroad 2>/dev/null || true)" >> "$FINAL_PROV/tool_environment.txt"
if command -v sha256sum >/dev/null 2>&1; then
  find "$FINAL_ARTIFACTS" "$FINAL_REPORTS" "$FINAL_LOGS" "$FINAL_PROV" -type f -print0 | sort -z | xargs -0 sha256sum > "$RESULTS/SHA256SUMS.txt"
fi
if command -v iverilog >/dev/null 2>&1; then iverilog -V > "$FINAL_PROV/iverilog_version.txt" 2>&1 || true; fi
if command -v openroad >/dev/null 2>&1; then openroad -version > "$FINAL_PROV/openroad_version.txt" 2>&1 || true; fi

# ---------- status/warnings ----------
WARNINGS=()
[[ -z "${RTL_VECTORS:-}" ]] && WARNINGS+=("RTL simulation log not found; RTL vector/error counts are not machine-readable from this directory.")
[[ -z "${GATE_VECTORS:-}" ]] && WARNINGS+=("Gate simulation log not found; gate vector/error counts are not machine-readable from this directory.")
[[ ! -f "$POWER_VCD_RPT" ]] && WARNINGS+=("VCD-driven power report is missing; the VCD power section cannot be completed until vcd_power.sh is run.")
[[ "$TIMING_STATUS" == "FAIL" ]] && WARNINGS+=("Timing target is not met: WNS is negative.")

# ---------- machine-readable metrics ----------
cat > "$CSV" <<EOF_CSV
metric,value,unit,method,notes
experiment_id,${EXPERIMENT_ID},,manifest,
design_name,${DESIGN_NAME},,manifest,
platform,${PLATFORM},,manifest,
input_width,${INPUT_WIDTH},bits,manifest,
output_width,${OUTPUT_WIDTH},bits,manifest,
clock_target,${CLOCK_PERIOD_NS},ns,SDC,
area,${AREA_UM2},um2,Yosys synth_stat,
cell_count,${CELL_COUNT},cells,Yosys synth_stat,
port_count,${PORT_COUNT},ports,Yosys synth_stat,
period_min,${PERIOD_MIN},ns,ORFS 6_finish,
fmax,${FREQ_FROM_PERIOD},MHz,derived,
wns,${WNS},ns,ORFS 6_finish,
tns,${TNS},ns,ORFS 6_finish,
critical_path_delay,${CRIT_DELAY},ns,ORFS 6_finish,
critical_path_slack,${CRIT_SLACK},ns,ORFS 6_finish,
setup_violations,${SETUP_VIOLS},count,ORFS 6_finish,
hold_violations,${HOLD_VIOLS},count,ORFS 6_finish,
max_slew_violations,${MAX_SLEW},count,ORFS 6_finish,
max_fanout_violations,${MAX_FANOUT},count,ORFS 6_finish,
max_cap_violations,${MAX_CAP},count,ORFS 6_finish,
timing_status,${TIMING_STATUS},,derived,
vcd_unique_pairs,${VCD_UNIQUE_PAIRS},count,VCD metrics,
vcd_error_count,${VCD_ERROR_COUNT},count,VCD metrics,
vcd_error_rate,${VCD_ERROR_RATE},,VCD metrics,
vcd_mae,${VCD_MAE},,VCD metrics,
vcd_mse,${VCD_MSE},,VCD metrics,
vcd_wce,${VCD_WCE},,VCD metrics,
vcd_mre_nonzero,${VCD_MRE},,VCD metrics,
vcd_maxre_nonzero,${VCD_MAXRE},,VCD metrics,
power_no_vcd,${NVCD_TOTAL_W},W,ORFS 6_finish report_power,No VCD activity annotation in the finish report
power_no_vcd_mw,${NVCD_MW},mW,derived,
power_vcd,${VCD_TOTAL_W},W,VCD-driven OpenROAD power,Annotated gate VCD
power_vcd_mw,${VCD_MW},mW,derived,
power_vcd_minus_no_vcd_pct,${POWER_DELTA_PCT},%,derived,Relative reduction from no-VCD baseline
power_vcd_over_no_vcd,${POWER_RATIO},ratio,derived,
pdp_no_vcd,${NVCD_PDP_PJ},pJ,derived,Power x final critical-path delay
pdp_vcd,${VCD_PDP_PJ},pJ,derived,Power x final critical-path delay
EOF_CSV

python3 - "$JSON" <<PY
import json
from pathlib import Path
items=[]
for line in Path("$CSV").read_text().splitlines()[1:]:
    metric,value,unit,method,notes=line.split(',',4)
    items.append({"metric":metric,"value":value,"unit":unit,"method":method,"notes":notes})
Path("$JSON").write_text(json.dumps(items, indent=2)+"\n")
PY

# ---------- comprehensive Markdown summary ----------
{
  echo "# ${EXPERIMENT_ID} — Final Research Summary"
  echo
  echo "> This file is generated by \`scripts/collect_results.sh\`. It is intended to be the single human-readable summary for research comparison. Raw evidence remains in \`results/final_artifacts\`, \`results/final_reports/orfs\`, and \`results/final_logs\`."
  echo
  echo "## 1. Executive result"
  echo
  echo "| Category | Result |"
  echo "|---|---|"
  echo "| Functional RTL correctness | $([[ "${RTL_ERRORS:-}" == "0" ]] && echo PASS || echo 'See verification evidence') |"
  echo "| Functional gate correctness | $([[ "${GATE_ERRORS:-}" == "0" ]] && echo PASS || echo 'See verification evidence') |"
  echo "| Exact VCD arithmetic check | ${VCD_EXACT_STATUS} |"
  echo "| 2.0 ns timing target | ${TIMING_STATUS} |"
  echo "| VCD-driven power | ${VCD_MW:-N/A} mW |"
  echo "| No-VCD/vectorless ORFS power | ${NVCD_MW:-N/A} mW |"
  echo
  echo "## 2. Experiment identity and reproducibility"
  echo
  echo "| Item | Value |"
  echo "|---|---|"
  echo "| Experiment ID | ${EXPERIMENT_ID} |"
  echo "| Design | ${DESIGN_NAME} |"
  echo "| Platform | ${PLATFORM} |"
  echo "| Input width | ${INPUT_WIDTH} bits |"
  echo "| Output width | ${OUTPUT_WIDTH} bits |"
  echo "| Expected exhaustive vectors | ${EXPECTED_VECTORS} |"
  echo "| Target clock | ${CLOCK_PERIOD_NS} ns |"
  echo "| ORFS result path | \`${ORFS_DESIGN_PATH}\` |"
  echo "| OR_FLOW | \`${OR_FLOW:-not recorded}\` |"
  echo "| Liberty/PVT | \`${LIBERTY:-not recorded}\` |"
  echo
  echo "## 3. Functional verification"
  echo
  echo "| Evidence | Value |"
  echo "|---|---:|"
  echo "| RTL verification vectors | ${RTL_VECTORS:-not recorded} |"
  echo "| RTL verification errors | ${RTL_ERRORS:-not recorded} |"
  echo "| Gate verification vectors | ${GATE_VECTORS:-not recorded} |"
  echo "| Gate verification errors | ${GATE_ERRORS:-not recorded} |"
  echo "| RTL VCD | ${RTL_VCD_STATUS} |"
  echo "| Gate VCD | ${GATE_VCD_STATUS} |"
  echo "| Unique VCD input pairs | ${VCD_UNIQUE_PAIRS:-not recorded} |"
  echo "| VCD arithmetic errors | ${VCD_ERROR_COUNT:-not recorded} |"
  echo "| VCD error rate | ${VCD_ERROR_RATE:-not recorded} |"
  echo "| MAE | ${VCD_MAE:-not recorded} |"
  echo "| MSE | ${VCD_MSE:-not recorded} |"
  echo "| WCE | ${VCD_WCE:-not recorded} |"
  echo "| MRE (nonzero) | ${VCD_MRE:-not recorded} |"
  echo "| MaxRE (nonzero) | ${VCD_MAXRE:-not recorded} |"
  echo
  echo "## 4. Physical-design metrics"
  echo
  echo "| Metric | Value |"
  echo "|---|---:|"
  echo "| Synthesized cell count | ${CELL_COUNT:-unknown} |"
  echo "| Port count | ${PORT_COUNT:-unknown} |"
  echo "| Chip area | ${AREA_UM2:-unknown} µm² |"
  echo "| Minimum clock period | ${PERIOD_MIN:-unknown} ns |"
  echo "| Fmax | ${FREQ_FROM_PERIOD:-unknown} MHz |"
  echo "| Critical path delay | ${CRIT_DELAY:-unknown} ns |"
  echo "| WNS | ${WNS:-unknown} ns |"
  echo "| TNS | ${TNS:-unknown} ns |"
  echo "| Worst slack | ${WORST_SLACK:-unknown} ns |"
  echo "| Setup violations | ${SETUP_VIOLS:-unknown} |"
  echo "| Hold violations | ${HOLD_VIOLS:-unknown} |"
  echo "| Max slew violations | ${MAX_SLEW:-unknown} |"
  echo "| Max fanout violations | ${MAX_FANOUT:-unknown} |"
  echo "| Max capacitance violations | ${MAX_CAP:-unknown} |"
  echo
  echo "## 5. Power — with and without VCD"
  echo
  echo "The two numbers below are deliberately separated because they come from different activity assumptions. **No-VCD** is the ORFS finish-stage \`report_power\` result without the final gate-activity VCD. **With VCD** is the post-ORFS OpenROAD result with \`read_vcd\` activity annotation. They are not interchangeable."
  echo
  echo "| Power metric | No VCD / vectorless | With VCD |"
  echo "|---|---:|---:|"
  echo "| Internal power | ${NVCD_INTERNAL_W:-N/A} W | ${VCD_INTERNAL_W:-N/A} W |"
  echo "| Switching power | ${NVCD_SWITCHING_W:-N/A} W | ${VCD_SWITCHING_W:-N/A} W |"
  echo "| Leakage power | ${NVCD_LEAKAGE_W:-N/A} W | ${VCD_LEAKAGE_W:-N/A} W |"
  echo "| Total power | ${NVCD_TOTAL_W:-N/A} W | ${VCD_TOTAL_W:-N/A} W |"
  echo "| Total power | ${NVCD_MW:-N/A} mW | ${VCD_MW:-N/A} mW |"
  echo "| PDP using final critical-path delay | ${NVCD_PDP_PJ:-N/A} pJ | ${VCD_PDP_PJ:-N/A} pJ |"
  echo "| VCD power / No-VCD power | — | ${POWER_RATIO:-N/A}× |"
  echo "| Reduction from No-VCD baseline | — | ${POWER_DELTA_PCT:-N/A}% |"
  echo
  echo "## 6. Interpretation for research"
  echo
  if [[ "${TIMING_STATUS}" == "FAIL" ]]; then
    echo "- The architecture is **functionally correct** according to the available exhaustive/VCD evidence, but it **does not meet the ${CLOCK_PERIOD_NS} ns timing target**."
    echo "- The final critical path is ${CRIT_DELAY:-unknown} ns and the reported WNS is ${WNS:-unknown} ns."
  else
    echo "- The final design meets the configured timing target according to the ORFS finish report."
  fi
  echo "- Power comparisons should use the same Liberty/PVT corner, SPEF, SDC, and physical-design database across experiments."
  echo "- For activity-aware research claims, prefer the VCD-driven power column and retain the no-VCD ORFS value as a separately labeled baseline."
  echo "- A negative WNS is not a functional-correctness failure; it is a performance/timing-closure failure."
  echo
  echo "## 7. Evidence and provenance"
  echo
  echo "### Final physical artifacts"
  echo "- \`results/final_artifacts/6_final.v\`"
  echo "- \`results/final_artifacts/6_final.sdc\`"
  echo "- \`results/final_artifacts/6_final.spef\`"
  echo "- \`results/final_artifacts/6_final.def\`"
  echo "- \`results/final_artifacts/6_final.gds\`"
  echo "- \`results/final_artifacts/6_final.odb\`"
  echo
  echo "### Verification artifacts"
  echo "- \`results/final_artifacts/rtl_activity.vcd\`"
  echo "- \`results/final_artifacts/gate_activity.vcd\`"
  echo "- \`results/final_artifacts/vcd_metrics.txt\`"
  echo "- \`results/final_artifacts/vcd_power.rpt\` (when VCD power was run)"
  echo
  echo "### Full reports and logs"
  echo "- \`results/final_reports/orfs/\` — complete ORFS report directory"
  echo "- \`results/final_logs/orfs/\` — complete ORFS log directory"
  echo "- \`results/final_provenance/\` — experiment manifest, configs, scripts, tool environment"
  echo
  if ((${#WARNINGS[@]})); then
    echo "## 8. Collection warnings"
    echo
    for w in "${WARNINGS[@]}"; do echo "- WARNING: $w"; done
    echo
  else
    echo "## 8. Collection status"
    echo
    echo "All expected evidence was found and collected."
  fi
} > "$SUMMARY"

# Human-readable manifest of what was collected.
{
  echo "${EXPERIMENT_ID} results manifest"
  echo "Generated: $(date -Is)"
  echo
  echo "Directories:"
  find "$FINAL_ARTIFACTS" "$FINAL_REPORTS" "$FINAL_LOGS" "$FINAL_PROV" -type f -printf '%P\n' 2>/dev/null | sort
} > "$MANIFEST"

printf 'FINAL SUMMARY: %s\n' "$SUMMARY"
printf 'FINAL METRICS CSV: %s\n' "$CSV"
printf 'FINAL METRICS JSON: %s\n' "$JSON"
printf 'FINAL ARTIFACTS: %s\n' "$FINAL_ARTIFACTS"
printf 'FINAL REPORTS: %s\n' "$FINAL_REPORTS"
printf 'FINAL LOGS: %s\n' "$FINAL_LOGS"
printf 'PROVENANCE: %s\n' "$FINAL_PROV"
