# EXP000 — Exact Dadda Baseline

## Definition

8x8 unsigned combinational multiplier using explicit HAs/FAs for the reduction network.

## Functional contract

For all 65,536 input pairs:

```text
P = A × B
```

The canonical RTL testbench and VCD checker both require zero mismatches.

## Physical-design contract

Use the shared experiment settings in `pd/config.mk` and `pd/constraint.sdc`. The gate-power script uses the final netlist, final SDC, final SPEF, the same Liberty/PVT corner, and `gate_activity.vcd`.

## Provenance note

The supplied archive already contained a completed EXP000 ORFS result tree and an earlier vector-based power report. Those artifacts are retained as evidence. The source scripts have been standardized so future reruns are reproducible and no longer depend on hard-coded user paths.
