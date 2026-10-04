# Physical-design configuration for EXP002_approx_meathod.
# Keep controlled comparison settings identical unless the research question
# explicitly changes them.

export PLATFORM = sky130hd
export DESIGN_NAME = approx_d1
export EXPERIMENT_ID = EXP002_approx_meathod

export RUN_DIR = $(abspath $(dir $(DESIGN_CONFIG)))
export PROJECT_ROOT = $(abspath $(RUN_DIR)/../../..)

export VERILOG_FILES = \
  $(PROJECT_ROOT)/rtl/REPLACE/source.sv

export SDC_FILE = $(RUN_DIR)/constraint.sdc

export CORE_UTILIZATION = 40
export CORE_ASPECT_RATIO = 1
export CORE_MARGIN = 2
export PLACE_DENSITY = 0.60
