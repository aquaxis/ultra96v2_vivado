############################################################
# Create Top Project

set project_name "ultra96v2"
set part_name    "xczu3eg-sbva484-1-e"
set block_name   "system"

exec rm -rf ${project_name}

# Create Project
create_project ${project_name} ./${project_name} -part ${part_name}

# Build block design
source src/${block_name}.tcl

# Create IP
generate_target all [get_files ${project_name}/${project_name}.srcs/sources_1/bd/${block_name}/${block_name}.bd]
set listips [create_ip_run [get_files -of_objects [get_fileset sources_1] ${project_name}/${project_name}.srcs/sources_1/bd/${block_name}/${block_name}.bd]]
# multiple job for create ip(YowaYowa PC)
launch_runs -jobs 4 ${listips}
# multiple job for create ip(TusyoTsuyo PC)
# launch_runs -jobs 16 ${listips}foreach {ips} [lsort -decreasing $listips] {
    wait_on_run ${ips}
}

# set parameter for clock
#set_property PFM.CLOCK {pl_clk0 {id "0" is_default "true" proc_sys_reset "/proc_sys_reset_0" status "fixed"}} [get_bd_cells /zynq_ultra_ps_e_0]

# make wrapper
make_wrapper -files [get_files ${project_name}/${project_name}.srcs/sources_1/bd/${block_name}/${block_name}.bd] -top
read_verilog ${project_name}/${project_name}.srcs/sources_1/bd/${block_name}/hdl/${block_name}_wrapper.v

# set top
set_property top ${block_name}_wrapper  [current_fileset]

# Synthesis
#set_param general.maxThreads 4
#synth_design -name ${project_name} -top ${block_name}_wrapper -part ${part_name} -mode out_of_context

# set pfm_name
set_property pfm_name system [get_files ${project_name}/${project_name}.srcs/sources_1/bd/${block_name}/${block_name}.bd]

# Export Hardware
write_hw_platform -force  -file ${project_name}.xsa

# Close Project
close_project
