# Dadda / Exact & Approximate Multiplier Research Repository

This repository is organized around reproducible, self-contained experiments. Active experiments use one canonical script contract; historical workflows remain frozen under `archive/legacy_runs/` for provenance.

## Directory ownership

```text
rtl/          Shared RTL and reusable RTL blocks
experiments/  One self-contained directory per active research experiment
reports/      Cross-experiment result/status tables
docs/         Research methodology and tool notes
tools/        Experiment-agnostic analysis/validation utilities
archive/      Frozen historical material; not part of the canonical workflow
```

## Environment contract

The active experiments assume: 

```bash
export OR_FLOW=/path/to/OpenROAD-flow-scripts/flow
export LIBERTY=/path/to/the/same/sky130hd/PVT/corner.lib
```

You already keep `OR_FLOW` in your `.bashrc`; that is the intended setup. The repository does **not** overwrite it and does **not** require `ORFS_FLOW_DIR`. `LIBERTY` is only required for vector-based power analysis.

Optional SKY130 gate-simulation overrides are supported:

```bash
export SKY130A_ROOT=/path/to/sky130A
export SKY130HD_PRIMITIVES=/path/to/primitives.v
export SKY130HD_VERILOG_MODEL=/path/to/sky130_fd_sc_hd.v
```

If these are unset, the gate-VCD scripts try `$PDK_ROOT/sky130A` and then the standard `/usr/local/share/pdk/sky130A` installation.

## Canonical experiment structure

```text
experiments/EXPxxx_method/
├── README.md
├── experiment.env
├── scripts/
│   ├── run_rtl.sh
│   ├── check_vcd.sh
│   ├── run_pd.sh
│   ├── generate_gate_vcd.sh
│   └── vcd_power.sh
├── verification/
├── pd/
├── results/
└── notes/
```

The `experiment.env` file contains only portable experiment metadata. Machine-specific paths belong in the shell environment, not in the repository.

## Canonical evidence chain

```text
RTL -> exhaustive RTL simulation -> RTL VCD -> metrics
  -> ORFS -> final netlist + SDC + SPEF
  -> gate-level exhaustive simulation -> gate VCD
  -> OpenROAD/OpenSTA read_vcd -> report_power
  -> measured PPA and functional evidence
```

Both active baselines use the same 65,536-vector exhaustive stimulus order, the same SKY130HD platform, and the same physical-design constraints. Only the architecture differs.

See `RUN_ORDER.txt`  procedure.

Simulation standard: Icarus must elaborate the experiment testbench as the top module; TOP_MODULE is the DUT and must not be passed to iverilog -s for RTL verification.

