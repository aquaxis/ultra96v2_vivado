hsi open_hw_design ultra96v2.xsa
hsi set_repo_path ./device-tree-xlnx
hsi create_sw_design device-tree -os device_tree -proc psu_cortexa53_0
hsi generate_target -dir dts
hsi close_hw_design [hsi current_hw_design]
exit