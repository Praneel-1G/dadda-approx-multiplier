

create_clock -name VCLK -period 2.000

# Assume inputs are available at the beginning of the 2 ns cycle.
set_input_delay 0.000 -clock VCLK [all_inputs]

# Require outputs by the end of the same 2 ns cycle.
set_output_delay 0.000 -clock VCLK [all_outputs]

# Reasonable idealized external assumptions for a standalone datapath block.
set_input_transition 0.050 [all_inputs]
set_load 0.005 [all_outputs]

# Do not optimize around false paths; this keeps all real input->output paths timed.
