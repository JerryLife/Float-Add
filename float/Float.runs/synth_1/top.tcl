# 
# Synthesis run script generated by Vivado
# 

debug::add_scope template.lib 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/VerilogCode/float/Float.cache/wt [current_project]
set_property parent.project_path D:/VerilogCode/float/Float.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog D:/VerilogCode/float/Float.srcs/sources_1/new/h_log_2.vh
read_verilog -library xil_defaultlib {
  D:/VerilogCode/float/Float.srcs/sources_1/new/float.v
  D:/VerilogCode/float/Float.srcs/sources_1/new/num2digit.v
  D:/VerilogCode/float/Float.srcs/sources_1/new/digit2num.v
  D:/VerilogCode/float/Float.srcs/sources_1/new/top.v
}
synth_design -top top -part xc7a100tcsg324-1
write_checkpoint -noxdef top.dcp
catch { report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb }
