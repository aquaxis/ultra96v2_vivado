platform create -name "ultra96v2_platform" -hw ./ultra96v2.xsa -out ./ -no-boot-bsp -proc psu_cortexa53 -os linux

domain active linux_domain
domain config -bif /home/hidemi/yocto/yocto_dunfell/build_ultra96v2/sd_card/build_vitis.bif
domain config -boot /home/hidemi/yocto/yocto_dunfell/build_ultra96v2/sd_card
domain config -image /home/hidemi/yocto/yocto_dunfell/build_ultra96v2/sd_card
domain config -sysroot /opt/poky/3.1_ultra96v2/sysroots/aarch64-poky-linux
platform generate
