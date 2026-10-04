create_clock -name VCLK -period 2.000

# Inputs are available at the beginning of the cycle.
set_input_delay 0.000 -clock VCLK [all_inputs]

# Outputs are required by the end of the same cycle.
set_output_delay 0.000 -clock VCLK [all_outputs]

# Controlled standalone datapath assumptions.
set_input_transition 0.050 [all_inputs]
set_load 0.005 [all_outputs]
