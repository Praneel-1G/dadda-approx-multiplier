#!/usr/bin/env bash
set -euo pipefail

EXP_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# shellcheck disable=SC1091
source "$EXP_ROOT/experiment.env"

: "${TOP_MODULE:?TOP_MODULE is missing from experiment.env}"
: "${GATE_TB_MODULE:?GATE_TB_MODULE is missing from experiment.env}"
: "${EXPECTED_VECTORS:?EXPECTED_VECTORS is missing from experiment.env}"

RESULT_DIR="$EXP_ROOT/pd/orfs/results/$ORFS_DESIGN_PATH"
FINAL_V="$RESULT_DIR/6_final.v"

SKY130A_ROOT="${SKY130A_ROOT:-}"
if [[ -z "$SKY130A_ROOT" && -n "${PDK_ROOT:-}" ]]; then
  SKY130A_ROOT="$PDK_ROOT/sky130A"
fi
SKY130A_ROOT="${SKY130A_ROOT:-/usr/local/share/pdk/sky130A}"
PRIMITIVES="${SKY130HD_PRIMITIVES:-$SKY130A_ROOT/libs.ref/sky130_fd_sc_hd/verilog/primitives.v}"
CELL_MODEL="${SKY130HD_VERILOG_MODEL:-$SKY130A_ROOT/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v}"

[[ -f "$FINAL_V" ]] || { echo "ERROR: missing $FINAL_V; run ./scripts/run_pd.sh first" >&2; exit 1; }
[[ -f "$PRIMITIVES" ]] || { echo "ERROR: missing primitives file: $PRIMITIVES" >&2; exit 1; }
[[ -f "$CELL_MODEL" ]] || { echo "ERROR: missing standard-cell model: $CELL_MODEL" >&2; exit 1; }
command -v iverilog >/dev/null 2>&1 || { echo "ERROR: iverilog not found" >&2; exit 1; }
command -v vvp >/dev/null 2>&1 || { echo "ERROR: vvp not found" >&2; exit 1; }

OUT="$EXP_ROOT/verification"
VVP="$OUT/gate_sim.vvp"
VCD="$OUT/gate_activity.vcd"
LOG="$OUT/gate_sim.log"
TB="$OUT/gate_tb.sv"
mkdir -p "$OUT"
rm -f "$VVP" "$VCD" "$LOG"

cat > "$TB" <<'EOT'
`timescale 1ns/1ps
module GATE_TB_NAME;
  reg [7:0] A;
  reg [7:0] B;
  wire [15:0] P;
  integer i, j;
  integer err;
  DESIGN_MODULE dut (.A(A), .B(B), .P(P));
  initial begin
    err = 0;
    A = 0;
    B = 0;
    $dumpfile("gate_activity.vcd");
    $dumpvars(0, GATE_TB_NAME);
    for (i = 0; i < 256; i = i + 1) begin
      for (j = 0; j < 256; j = j + 1) begin
        A = i;
        B = j;
        #1;
        if (P !== (A * B)) begin
          err = err + 1;
          if (err <= 10)
            $display("ERROR A=%0d B=%0d expected=%0d got=%0d", A, B, A * B, P);
        end
      end
    end
    $display("GATE_VERIFY_VECTORS=__EXPECTED_VECTORS__");
    $display("GATE_VERIFY_ERRORS=%0d", err);
    if (err != 0)
      $fatal(1, "Gate-level verification failed");
    $finish;
  end
endmodule
EOT

sed -i \
  -e "s/GATE_TB_NAME/$GATE_TB_MODULE/g" \
  -e "s/DESIGN_MODULE/$TOP_MODULE/g" \
  -e "s/__EXPECTED_VECTORS__/$EXPECTED_VECTORS/g" \
  "$TB"

iverilog -g2012 -s "$GATE_TB_MODULE" -o "$VVP" \
  "$PRIMITIVES" "$CELL_MODEL" "$FINAL_V" "$TB" 2>&1 | tee "$LOG"

(
  cd "$OUT"
  vvp "$(basename "$VVP")"
) 2>&1 | tee -a "$LOG"

test -s "$VCD" || { echo "ERROR: gate VCD was not generated: $VCD" >&2; exit 1; }
grep -q 'GATE_VERIFY_ERRORS=0' "$LOG" || { echo "ERROR: gate verification did not report zero errors" >&2; exit 1; }
grep -q "GATE_VERIFY_VECTORS=$EXPECTED_VECTORS" "$LOG" || { echo "ERROR: gate verification did not run exactly $EXPECTED_VECTORS vectors" >&2; exit 1; }

echo "Gate verification PASS: $EXPECTED_VECTORS vectors"
echo "Generated: $VCD"
