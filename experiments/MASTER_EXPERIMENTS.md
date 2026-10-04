# Master Experiment Register

| ID | Method / architecture | Type | RTL verification | Gate VCD | ORFS PD | Power | Paper role |
|---|---|---|---|---|---|---|---|
| EXP000 | Exact 8x8 Dadda, HA/FA reduction | Exact baseline | PASS, 65,536/65,536 | PASS, existing evidence | PRESENT in archive | PRESENT, vector-based report | Reference architecture |
| EXP001 | Exact 8x8 Dadda using exact 4:2 compressors built from 2 FAs | Exact architectural variant | PASS after standardized rerun | Not yet regenerated in supplied archive | Not present in supplied archive | Not measured under canonical flow | Compressor comparison baseline |
| EXP002+ | Future method | Approximate | Required | Required | Required | Required | Research candidates |

## Canonical experiment naming

Use `EXP###_<short_method_name>`. Never overwrite an existing experiment; create a new ID for a new architecture, width, approximation strength, or other independent condition.

## Controlled variables

Keep these identical across comparable experiments unless they are the research variable:

- technology/platform
- Liberty/PVT corner
- clock/SDC
- input/output width
- exhaustive vector ordering
- input transition/output load
- utilization/aspect ratio/margins/placement density
- ORFS revision
- RTL/gate simulation tools and versions
- power-analysis procedure
