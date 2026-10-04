# ORFS design configuration: exact Dadda multiplier WITHOUT compressor
# Use with: make DESIGN_CONFIG=/absolute/path/to/config_no_comp.mk

export PLATFORM = sky130hd
export DESIGN_NAME = exact_dadda_no_comp

# Project root is inferred from the location of this config when DESIGN_CONFIG
# is passed as an absolute path to make.
export RUN_DIR = $(abspath $(dir $(DESIGN_CONFIG)))
export PROJECT_ROOT = $(abspath $(RUN_DIR)/../../..)

export VERILOG_FILES = \
  $(PROJECT_ROOT)/src/exact/exact_dadda_no_comp.sv \
  $(PROJECT_ROOT)/src/common/fa.sv \
  $(PROJECT_ROOT)/src/common/ha.sv \
  $(PROJECT_ROOT)/src/common/input_reorder.sv

export SDC_FILE = $(RUN_DIR)/constraint_no_comp.sdc

# Keep identical physical-design settings for a fair with/without-compressor comparison.
export CORE_UTILIZATION  = 40
export CORE_ASPECT_RATIO = 1
export CORE_MARGIN       = 2
export PLACE_DENSITY     = 0.60

# Useful reproducibility metadata for the report script.
export VCD_FILE  = $(RUN_DIR)/../verification/activity_no_comp.vcd
export VCD_SCOPE = tb_exact_dadda_without_compressor/dut
