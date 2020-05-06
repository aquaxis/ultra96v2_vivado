set hwdsgn [hsi open_hw_design ultra96v2.xsa] 
hsi generate_app -hw $hwdsgn -os standalone -proc psu_cortexa53_0 -app zynqmp_fsbl -compile -sw fsbl -dir fsbl
exit
