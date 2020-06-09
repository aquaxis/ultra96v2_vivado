all: create_design create_fsbl download_dts create_dts create_pfm

create_design:
	vivado -mode batch -source create_design.tcl -log log_create_design.log

create_fsbl:
	xsct create_fsbl.tcl
	cp fsbl/executable.elf ./fsbl.elf

download_dts:
	git clone https://github.com/Xilinx/device-tree-xlnx.git -b xilinx-v2020.1

create_dts:
	xsct create_dts.tcl

create_pfm:
	xsct create_pfm.tcl

clean:
	rm -rf *.jou *.log *.str *.dcp *.mcs *.prm *.bit
	rm -rf usage_*.html tight*.txt usage_statistics_webtalk.xml
	rm -rf ultra96v2.xsa
	rm -rf psu_init*
	rm -rf hd_visual ultra96v2 xsa
	rm -rf fsbl drivers
	rm -rf dts device-tree-xlnx
	rm -rf nohup.out
	rm -rf ultra96v2_platform
	rm -rf fsbl.elf

