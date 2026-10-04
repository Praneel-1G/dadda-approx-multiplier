read_db "/home/praneel/vlsi/projects/IDP_2/experiments/EXP000_exact_dadda_no_comp/pd/orfs/results/sky130hd/exact_dadda_no_comp/base/6_final.odb"
read_liberty "/usr/local/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib"
read_sdc "/home/praneel/vlsi/projects/IDP_2/experiments/EXP000_exact_dadda_no_comp/pd/orfs/results/sky130hd/exact_dadda_no_comp/base/6_final.sdc"
read_vcd -scope "tb_gate_exact_dadda_no_comp/dut" "/home/praneel/vlsi/projects/IDP_2/experiments/EXP000_exact_dadda_no_comp/verification/gate_activity.vcd"
report_power -digits 6
