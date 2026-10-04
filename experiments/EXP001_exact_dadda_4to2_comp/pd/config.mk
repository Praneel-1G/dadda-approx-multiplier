# EXP001: exact Dadda-style multiplier using exact 4:2 compressors built from 2 FAs
export PLATFORM = sky130hd
export DESIGN_NAME = exact_dadda_with_compressor
export EXPERIMENT_ID = EXP001_exact_dadda_4to2_comp

export RUN_DIR = $(abspath $(dir $(DESIGN_CONFIG)))
export PROJECT_ROOT = $(abspath $(RUN_DIR)/../../..)

export VERILOG_FILES = \
  $(PROJECT_ROOT)/rtl/exact/exact_dadda_w_comp.sv \
  $(PROJECT_ROOT)/rtl/exact/exact4_2_comp.sv \
  $(PROJECT_ROOT)/rtl/common/fa.sv \
  $(PROJECT_ROOT)/rtl/common/ha.sv

export SDC_FILE = $(RUN_DIR)/constraint.sdc

# Controlled physical-design settings: identical to EXP000.
export CORE_UTILIZATION  = 40
export CORE_ASPECT_RATIO = 1
export CORE_MARGIN       = 2
export PLACE_DENSITY     = 0.60
