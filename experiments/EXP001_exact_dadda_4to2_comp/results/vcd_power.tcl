set exp_root [file normalize [file join [file dirname [info script]] ..]]
set result_dir [file join $exp_root pd orfs results sky130hd/exact_dadda_with_compressor/base]
set final_odb [file join $result_dir 6_final.odb]
set final_sdc [file join $result_dir 6_final.sdc]
set final_spef [file join $result_dir 6_final.spef]
set vcd [file join $exp_root verification gate_activity.vcd]
set liberty $::env(LIBERTY)

read_liberty $liberty
read_db $final_odb
read_sdc $final_sdc
read_spef $final_spef
read_vcd -scope "tb_gate_exact_dadda_with_compressor/dut" $vcd

report_checks -path_delay max -digits 4
report_worst_slack -max -digits 4
report_tns -max -digits 4
report_power -digits 6

