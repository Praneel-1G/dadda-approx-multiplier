# EXP000: exact Dadda 8x8 multiplier without explicit 4:2 compressors
export PLATFORM = sky130hd
export DESIGN_NAME = exact_dadda_no_comp
export EXPERIMENT_ID = EXP000_exact_dadda_no_comp

export RUN_DIR = $(abspath $(dir $(DESIGN_CONFIG)))
export PROJECT_ROOT = $(abspath $(RUN_DIR)/../../..)

export VERILOG_FILES = \
  $(PROJECT_ROOT)/rtl/exact/exact_dadda_no_comp.sv \
  $(PROJECT_ROOT)/rtl/common/fa.sv \
  $(PROJECT_ROOT)/rtl/common/ha.sv

export SDC_FILE = $(RUN_DIR)/constraint.sdc

# Controlled physical-design settings: identical to EXP001.
export CORE_UTILIZATION  = 40
export CORE_ASPECT_RATIO = 1
export CORE_MARGIN       = 2
export PLACE_DENSITY     = 0.60
