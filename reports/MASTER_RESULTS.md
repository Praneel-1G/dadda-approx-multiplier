# Master Results Table

`PENDING` means the quantity is not yet measured under the canonical standardized flow. Values already present in the supplied EXP000 evidence are labeled below so they are not confused with future EXP001 measurements.

| ID | Method | Vectors | ER | MAE | MSE | WCE | MRE_nonzero | Area (µm²) | WNS (ns) | TNS (ns) | Min period / Delay (ns) | Internal (mW) | Switching (mW) | Leakage (mW) | Total Power (mW) | PDP (pJ) | DRC | Antenna | RTL VCD | Gate VCD |
|---|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---|---|
| EXP000 | Exact Dadda without explicit 4:2 compressors | 65,536 | 0 | 0 | 0 | 0 | 0 | 2968 | -1.62 | -15.17 | 3.62 | 0.9474868 | 0.6009078 | 0.000001410784 | 1.548396* | PENDING | 0 (final route) | 0 | PASS | PASS |
| EXP001 | Exact Dadda with exact 4:2 compressors | PENDING | PENDING | PENDING | PENDING | PENDING | PENDING | PENDING | PENDING | PENDING | PENDING | PENDING | PENDING | PENDING | PENDING | PENDING | PENDING | PENDING | PENDING | PENDING |

## EXP000 evidence sources

- Functional metrics: `experiments/EXP000_exact_dadda_no_comp/results/vcd_metrics.txt`
- Final physical-design reports: `experiments/EXP000_exact_dadda_no_comp/pd/orfs/reports/sky130hd/exact_dadda_no_comp/base/`
- Final design report: `.../6_finish.rpt`
- Pre-standardization vector-based power report: `experiments/EXP000_exact_dadda_no_comp/results/archive_pre_standardization/vcd_power_legacy.rpt`

`*` The EXP000 power number is preserved from the supplied archive. It has not been regenerated with the current standardized power script in this environment.

## Rules

Do not fill a cell from memory or from a different script. Record only values traceable to the experiment's evidence bundle. Do not claim a PPA improvement between EXP000 and EXP001 until EXP001 is run through the same ORFS + gate-VCD + power procedure.
