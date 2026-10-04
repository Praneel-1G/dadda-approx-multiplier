# EXP000 Working Reference

This is the canonical reference copy of the EXP000 script/configuration contract used to build future experiments.

Important: the most recent user-uploaded `IDP_2_standardized_FIXED4(1).zip` was truncated before its `scripts/` directory, so the exact latest local edits could not be recovered from that upload. This reference is reconstructed from the last complete EXP000 package available in the workspace, with the known `vcd_power.sh` stray-heredoc issue removed and the research collector added.

Use this directory as the behavioral reference, but keep your own current EXP000 directory as the ultimate source of truth for any local-only changes until the small script-only bundle is re-uploaded.

Files:
- `experiment.env` — experiment metadata contract
- `pd/config.mk` — ORFS design configuration
- `pd/constraint.sdc` — controlled timing assumptions
- `scripts/` — canonical run/verification/power/collection scripts
