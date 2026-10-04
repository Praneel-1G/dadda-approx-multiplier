# Physical-design configuration for EXP002_approx_meathod.
# Keep controlled comparison settings identical unless the research question
# explicitly changes them.

export PLATFORM = sky130hd
export DESIGN_NAME = approx_dadda_d1
export EXPERIMENT_ID = EXP002_approx_meathod

export RUN_DIR = $(abspath $(dir $(DESIGN_CONFIG)))
export PROJECT_ROOT = $(abspath $(RUN_DIR)/../../..)

export VERILOG_FILES = \
  $(PROJECT_ROOT)/rtl/approx/d1/approx_dadda_d1.sv \
  $(PROJECT_ROOT)/rtl/exact/exact4_2_comp.sv \
  $(PROJECT_ROOT)/rtl/approx/d1/d1_compressor_block.sv \
  $(PROJECT_ROOT)/rtl/approx/d1/approx4_2_comp_d1.sv \
  $(PROJECT_ROOT)/rtl/common/ha.sv \
  $(PROJECT_ROOT)/rtl/common/fa.sv \
  $(PROJECT_ROOT)/rtl/common/input_reorder.sv

export SDC_FILE = $(RUN_DIR)/constraint.sdc

export CORE_UTILIZATION = 40
export CORE_ASPECT_RATIO = 1
export CORE_MARGIN = 2
export PLACE_DENSITY = 0.60
