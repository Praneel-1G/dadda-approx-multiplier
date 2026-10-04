# New IDP-2 Experiment Template

This directory is a starting point for a new active research experiment.

Before running anything:

1. Fill in `experiment.env` with the exact DUT/testbench/module names and RTL source list.
2. Replace the placeholder RTL path in `pd/config.mk`.
3. Put the new RTL under the shared repository `rtl/` tree.
4. Create the RTL and gate testbench modules so they follow the same 65,536-vector contract for an 8x8 multiplier.
5. Use the same physical-design settings unless the research variable requires a controlled change.

Canonical run order:

```bash
./scripts/run_rtl.sh
./scripts/check_vcd.sh
./scripts/run_pd.sh
./scripts/generate_gate_vcd.sh
./scripts/vcd_power.sh
./scripts/collect_results.sh
```
