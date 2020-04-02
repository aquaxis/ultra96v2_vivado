all: create_design

create_design:
	vivado -mode batch -source create_design.tcl -log log_create_design.log

clean:
	rm -rf *.jou *.log *.str *.dcp *.mcs *.prm *.bit
	rm -rf usage_*.html tight*.txt usage_statistics_webtalk.xml
	rm -rf ultra96v2_wrapper.xsa
	rm -rf hd_visual ultra96v2
	rm -rf nohup.out
