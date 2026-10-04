#!/usr/bin/env bash
set -euo pipefail

# ============================================================
# Generate a GATE-LEVEL VCD from the completed ORFS netlist.
#
# Usage:
#   ./scripts/generate_gate_vcd.sh no_comp  runs/iter_01_exact_baseline
#   ./scripts/generate_gate_vcd.sh with_comp runs/iter_01_exact_baseline
#
# Assumptions for this project:
#   top ports: A[7:0], B[7:0], P[15:0]
#   no_comp top: exact_dadda_no_comp
#   with_comp top: exact_dadda_with_compressor
#
# This is AFTER ORFS has produced 6_final.v.
# ============================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

MODE="${1:-}"
RUN_DIR_ARG="${2:-}"

if [[ "$MODE" != "no_comp" && "$MODE" != "with_comp" ]]; then
    echo "Usage:"
    echo "  $0 no_comp  <run_directory>"
    echo "  $0 with_comp <run_directory>"
    exit 1
fi

if [[ -z "$RUN_DIR_ARG" ]]; then
    echo "ERROR: run directory is required."
    exit 1
fi

RUN_DIR="$(cd "$PROJECT_ROOT/$RUN_DIR_ARG" 2>/dev/null && pwd)" || {
    echo "ERROR: Run directory does not exist:"
    echo "  $PROJECT_ROOT/$RUN_DIR_ARG"
    exit 1
}

# ORFS location: override with ORFS_FLOW_DIR if needed.
ORFS_FLOW_DIR="${ORFS_FLOW_DIR:-$HOME/vlsi/tools/OpenROAD-flow-scripts/flow}"

if [[ "$MODE" == "no_comp" ]]; then
    DESIGN_NAME="exact_dadda_no_comp"
    TB_NAME="tb_gate_no_comp"
    VCD_NAME="gate_activity_no_comp.vcd"
else
    DESIGN_NAME="exact_dadda_with_compressor"
    TB_NAME="tb_gate_with_comp"
    VCD_NAME="gate_activity_with_comp.vcd"
fi

ORFS_RESULT="$ORFS_FLOW_DIR/results/sky130hd/$DESIGN_NAME/base"
FINAL_V="$ORFS_RESULT/6_final.v"

OUT_DIR="$RUN_DIR/verification"
VVP="$OUT_DIR/${DESIGN_NAME}_gate.vvp"
VCD="$OUT_DIR/$VCD_NAME"
TB="$OUT_DIR/${TB_NAME}.sv"
LOG="$OUT_DIR/${DESIGN_NAME}_gate_sim.log"

mkdir -p "$OUT_DIR"

echo "============================================================"
echo " Gate-level VCD generation"
echo " Design : $DESIGN_NAME"
echo " Run    : $RUN_DIR"
echo "============================================================"

command -v iverilog >/dev/null 2>&1 || {
    echo "ERROR: iverilog not found."
    echo "Install Icarus Verilog or activate your EDA environment."
    exit 1
}

command -v vvp >/dev/null 2>&1 || {
    echo "ERROR: vvp not found."
    exit 1
}

if [[ ! -f "$FINAL_V" ]]; then
    echo "ERROR: ORFS final netlist not found:"
    echo "  $FINAL_V"
    echo
    echo "Run the ORFS flow to completion first."
    exit 1
fi

# ------------------------------------------------------------
# Locate the SKY130HD behavioral Verilog cell model.
# ------------------------------------------------------------
CELL_MODEL=""

CANDIDATES=(
    "${PDK_ROOT:-}/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v"
    "${PDK_ROOT:-}/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v"
    "$HOME/.volare/volare/sky130/sky130_fd_sc_hd/sky130_fd_sc_hd.v"
    "/usr/local/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v"
    "/usr/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v"
)

for f in "${CANDIDATES[@]}"; do
    if [[ -n "$f" && -f "$f" ]]; then
        CELL_MODEL="$f"
        break
    fi
done

if [[ -z "$CELL_MODEL" ]]; then
    SEARCH_ROOTS=()
    [[ -n "${PDK_ROOT:-}" && -d "$PDK_ROOT" ]] && SEARCH_ROOTS+=("$PDK_ROOT")
    [[ -d "$ORFS_FLOW_DIR" ]] && SEARCH_ROOTS+=("$ORFS_FLOW_DIR")
    [[ -d "$HOME/vlsi/tools" ]] && SEARCH_ROOTS+=("$HOME/vlsi/tools")

    for root in "${SEARCH_ROOTS[@]}"; do
        CELL_MODEL="$(find "$root" -type f -name 'sky130_fd_sc_hd.v' 2>/dev/null | head -n 1 || true)"
        [[ -n "$CELL_MODEL" ]] && break
    done
fi

if [[ -z "$CELL_MODEL" ]]; then
    echo "ERROR: Could not find sky130_fd_sc_hd.v."
    echo
    echo "Find it manually with:"
    echo "  find \"\$PDK_ROOT\" -name sky130_fd_sc_hd.v 2>/dev/null"
    echo
    echo "Then rerun with PDK_ROOT set correctly."
    exit 1
fi

echo "Final netlist : $FINAL_V"
echo "Cell model    : $CELL_MODEL"
echo "Output VCD    : $VCD"
echo

# ------------------------------------------------------------
# Generate a gate-level testbench.
# We intentionally do NOT use the RTL parameter override,
# because the synthesized gate netlist is not parameterized.
# ------------------------------------------------------------
cat > "$TB" <<EOF
\`timescale 1ns/1ps

module $TB_NAME;

    logic [7:0]  A;
    logic [7:0]  B;
    wire  [15:0] P;

    integer i;
    integer j;
    integer pass_count;
    integer error_count;

    $DESIGN_NAME dut (
        .A(A),
        .B(B),
        .P(P)
    );

    initial begin
        pass_count  = 0;
        error_count = 0;
        A = 8'h00;
        B = 8'h00;

        // Dump the complete DUT hierarchy for VCD activity annotation.
        \$dumpfile("$VCD_NAME");
        \$dumpvars(0, $TB_NAME);

        \$display("==================================================");
        \$display("Gate-level exhaustive simulation");
        \$display("Design: $DESIGN_NAME");
        \$display("Vectors: 65,536");
        \$display("==================================================");

        for (i = 0; i < 256; i = i + 1) begin
            for (j = 0; j < 256; j = j + 1) begin
                A = i;
                B = j;
                #1;

                if (P !== (A * B)) begin
                    error_count = error_count + 1;
                    if (error_count <= 10) begin
                        \$display("ERROR t=%0t A=%0d B=%0d Expected=%0d Actual=%0d",
                                 \$time, A, B, (A * B), P);
                    end
                end
                else begin
                    pass_count = pass_count + 1;
                end
            end
        end

        \$display("");
        \$display("==================================================");
        \$display("Gate-level verification complete");
        \$display("Total : %0d", pass_count + error_count);
        \$display("Pass  : %0d", pass_count);
        \$display("Fail  : %0d", error_count);
        \$display("==================================================");

        \$finish;
    end

endmodule
EOF

rm -f "$VVP" "$VCD" "$LOG"

echo "[1/2] Compiling gate-level netlist..."
iverilog -g2012 \
    -s "$TB_NAME" \
    -o "$VVP" \
    "$CELL_MODEL" \
    "$FINAL_V" \
    "$TB" \
    2>&1 | tee "$LOG"

echo "[2/2] Running gate-level simulation..."
(
    cd "$OUT_DIR"
    vvp "$(basename "$VVP")"
) 2>&1 | tee -a "$LOG"

if [[ ! -f "$VCD" ]]; then
    echo
    echo "ERROR: Simulation finished but VCD was not created."
    exit 1
fi

echo
echo "============================================================"
echo "DONE"
echo "VCD: $VCD"
ls -lh "$VCD"
echo "============================================================"