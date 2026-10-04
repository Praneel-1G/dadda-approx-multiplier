# Current Status Report — Dadda Multiplier Research Project

## Executive summary

The repository has been standardized around two active exact baseline experiments. The canonical scripts no longer use machine-specific paths and use the user's existing `OR_FLOW` shell variable for OpenROAD-flow-scripts.

## Active experiments

### EXP000 — exact Dadda without explicit 4:2 compressors

- RTL exhaustive verification: **PASS** for 65,536/65,536 vectors.
- RTL VCD: present.
- ORFS final netlist/SDC/SPEF: present in the supplied archive.
- Gate VCD: present in the supplied archive.
- Pre-standardization vector-based OpenROAD power report: preserved under `results/archive_pre_standardization/`.
- Existing pre-standardization total vector-based power result: **1.548396 mW**.
- Existing final design area: **2968 µm²**.
- Existing worst setup slack: **-1.62 ns**.
- Existing TNS: **-15.17 ns**.
- Existing minimum clock period reported by ORFS: **3.62 ns** (276.55 MHz).
- Existing final route reports show no antenna violations; final routing reports must be used for any DRC claim.

These values describe the supplied EXP000 physical-design artifacts. They are retained as provenance and are not claimed as a fresh run of the standardized power script.

### EXP001 — exact Dadda with exact 4:2 compressors

- RTL testbench is standardized and fixes the previous VCD filename mismatch.
- RTL VCD must be regenerated with `run_rtl.sh` and checked with `check_vcd.sh`.
- ORFS final artifacts are not present in the supplied archive.
- Gate VCD and vector-based power are therefore not yet available from the canonical pipeline.

## What the standardization fixed

1. Both active experiments use the same `experiment.env` contract.
2. Both ORFS runners use `$OR_FLOW`; `ORFS_FLOW_DIR` is not used.
3. Both RTL testbenches write `verification/rtl_activity.vcd`.
4. Both gate runners use the same primitives + standard-cell-model compile setup and require `GATE_VERIFY_ERRORS=0`.
5. Both power runners use the same `read_liberty` + `read_verilog` + `link_design` + `read_sdc` + `read_spef` + `read_vcd` + reporting sequence.
6. Checked-in generated Tcl no longer contains the old absolute home directory.
7. Historical legacy files are retained under `archive/legacy_runs/` but are explicitly excluded from the canonical active workflow.

## Research interpretation

Both current designs are exact. They are reference architectures. Approximate methods should start at `EXP002+` and follow the same evidence contract.
