# EXP001 — Exact 4:2 Compressor Variant

## Definition

8x8 unsigned combinational multiplier using the supplied exact 4:2 compressor construction (two full adders).

## Functional contract

For all 65,536 input pairs:

```text
P = A × B
```

The canonical RTL testbench and VCD checker both require zero mismatches.

## Controlled comparison

This experiment uses the same technology, SDC, utilization, aspect ratio, margin, placement density, stimulus order, gate-simulation procedure, and Liberty/PVT contract as EXP000.

## Previous script correction

The archived script had a Bash parameter-expansion typo and an inconsistent VCD filename. Both are fixed in the standardized script/testbench.

## Physical-design status

Run `run_pd.sh`, then `generate_gate_vcd.sh`, then `vcd_power.sh` before adding physical/power values to the master table.
