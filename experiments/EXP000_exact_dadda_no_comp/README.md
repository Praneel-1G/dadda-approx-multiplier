# EXP000_exact_dadda_no_comp

Self-contained active research experiment. The scripts in this directory are standardized with the other active experiments and use the portable metadata in `experiment.env`.

## Canonical sequence

```bash
./scripts/run_rtl.sh
./scripts/check_vcd.sh
./scripts/run_pd.sh
./scripts/generate_gate_vcd.sh
export LIBERTY=/path/to/the/same/sky130hd/PVT/liberty.used.by.ORFS
./scripts/vcd_power.sh
```

`OR_FLOW` is expected from your shell environment (you keep it in `.bashrc`). The scripts do not modify it.
