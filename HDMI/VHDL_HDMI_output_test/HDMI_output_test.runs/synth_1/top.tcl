# 
# Synthesis run script generated by Vivado
# 

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
set_param simulator.modelsimInstallPath E:/Modelsim_SE_10.5/win64
create_project -in_memory -part xc7z010clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir F:/Vivado/ZYBO_Project/02_HDMI_output_test/HDMI_output_test.cache/wt [current_project]
set_property parent.project_path F:/Vivado/ZYBO_Project/02_HDMI_output_test/HDMI_output_test.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_repo_paths f:/Vivado/ZYBO_Project/HDMI_Output_Disp/rgb2dvi_v1_2 [current_project]
set_property ip_cache_permissions disable [current_project]
read_verilog -library xil_defaultlib {
  F:/Vivado/ZYBO_Project/02_HDMI_output_test/HDMI_output_test.srcs/sources_1/imports/sources_1/color_bar.v
  F:/Vivado/ZYBO_Project/02_HDMI_output_test/HDMI_output_test.srcs/sources_1/imports/sources_1/top.v
}
read_vhdl -library xil_defaultlib {
  F:/Vivado/ZYBO_Project/02_HDMI_output_test/rgb2dvi_v1_2/src/SyncAsync.vhd
  F:/Vivado/ZYBO_Project/02_HDMI_output_test/rgb2dvi_v1_2/src/SyncAsyncReset.vhd
  F:/Vivado/ZYBO_Project/02_HDMI_output_test/rgb2dvi_v1_2/src/ClockGen.vhd
  F:/Vivado/ZYBO_Project/02_HDMI_output_test/HDMI_output_test.srcs/sources_1/imports/src/DVI_Constants.vhd
  F:/Vivado/ZYBO_Project/02_HDMI_output_test/rgb2dvi_v1_2/src/DVI_Constants.vhd
  F:/Vivado/ZYBO_Project/02_HDMI_output_test/rgb2dvi_v1_2/src/OutputSERDES.vhd
  F:/Vivado/ZYBO_Project/02_HDMI_output_test/rgb2dvi_v1_2/src/TMDS_Encoder.vhd
  F:/Vivado/ZYBO_Project/02_HDMI_output_test/rgb2dvi_v1_2/src/rgb2dvi.vhd
}
read_ip -quiet F:/Vivado/ZYBO_Project/02_HDMI_output_test/HDMI_output_test.srcs/sources_1/ip/video_pll/video_pll.xci
set_property used_in_implementation false [get_files -all f:/Vivado/ZYBO_Project/02_HDMI_output_test/HDMI_output_test.srcs/sources_1/ip/video_pll/video_pll_board.xdc]
set_property used_in_implementation false [get_files -all f:/Vivado/ZYBO_Project/02_HDMI_output_test/HDMI_output_test.srcs/sources_1/ip/video_pll/video_pll.xdc]
set_property used_in_implementation false [get_files -all f:/Vivado/ZYBO_Project/02_HDMI_output_test/HDMI_output_test.srcs/sources_1/ip/video_pll/video_pll_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc F:/Vivado/ZYBO_Project/02_HDMI_output_test/HDMI_output_test.srcs/constrs_1/new/top.xdc
set_property used_in_implementation false [get_files F:/Vivado/ZYBO_Project/02_HDMI_output_test/HDMI_output_test.srcs/constrs_1/new/top.xdc]


synth_design -top top -part xc7z010clg400-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb"
