# EXP000 — Confirmed results from the 2026-10-04 run

These values were transcribed from the user-provided terminal log. The raw `vcd_power.rpt` should remain the authoritative source for numerical citation.

## Functional verification

- Gate vectors: 65,536
- Gate errors: 0
- Gate verification: PASS
- Gate activity VCD: generated successfully
- RTL VCD exact check: 65,536 unique pairs, 0 errors, MAE 0, MSE 0, WCE 0

## Timing

- Critical path / data arrival: 3.6160 ns
- Required time: 2.0000 ns
- WNS: -1.6160 ns
- TNS: -15.1671 ns
- The 2.000 ns timing target is not met.

## VCD-driven power

- Internal: 9.913018e-04 W = 0.991302 mW
- Switching: 7.979030e-04 W = 0.797903 mW
- Leakage: 1.410784e-09 W = 0.000001411 mW
- Total: 1.789206e-03 W = 1.789206 mW

Do not treat this note as a replacement for the raw ORFS/OpenROAD reports.
