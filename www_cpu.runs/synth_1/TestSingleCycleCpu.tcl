# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/www/www_cpu/www_cpu.cache/wt [current_project]
set_property parent.project_path C:/Users/www/www_cpu/www_cpu.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/www/www_cpu/www_cpu.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files {{C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/Test_8_Instr1.coe}}
read_verilog {{C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/AluOp.vh}}
set_property file_type "Verilog Header" [get_files {{C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/AluOp.vh}}]
read_verilog -library xil_defaultlib {
  {C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/AC.v}
  {C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/ALU.v}
  {C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/AddPC.v}
  {C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/CPU.v}
  {C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/Control.v}
  {C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/DataMEM.v}
  {C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/EXMEM.v}
  {C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/FWB.v}
  {C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/Flush.v}
  {C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/IDEX.v}
  {C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/IFID.v}
  {C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/ImmGen.v}
  {C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/InsMEM.v}
  {C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/MEMWB.v}
  {C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/MuxFWD.v}
  {C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/MuxMemtoR.v}
  {C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/MuxRtoALU.v}
  {C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/PC.v}
  {C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/PCadd1.v}
  {C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/PCaddExtend.v}
  {C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/RegisterFile.v}
  {C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/Stall.v}
  {C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/seg7x16.v}
  {C:/Users/www/www_cpu/www_cpu.srcs/sources_1/imports/qq file/zjf_cpu_code/TestSingleCycleCpu.v}
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/www/www_cpu/www_cpu.srcs/constrs_1/imports/qq file/icf.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/www/www_cpu/www_cpu.srcs/constrs_1/imports/qq file/icf.xdc}}]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top TestSingleCycleCpu -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef TestSingleCycleCpu.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file TestSingleCycleCpu_utilization_synth.rpt -pb TestSingleCycleCpu_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
