set yocto_path "/disk/yocto/yocto_gatesgarth/build_ultra96v2"
set sdk_path   "/opt/poky/3.2_ultra96v2"

platform create -name "ultra96v2_platform" -hw ./ultra96v2.xsa -out ./ -no-boot-bsp -proc psu_cortexa53 -os linux

domain active linux_domain
domain config -bif ${yocto_path}/sd_card/build_vitis.bif
domain config -boot ${yocto_path}/sd_card
domain config -image ${yocto_path}/sd_card
domain config -sysroot ${sdk_path}/sysroots/cortexa72-cortexa53-poky-linux
platform generate
