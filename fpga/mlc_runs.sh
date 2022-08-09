#!/bin/bash

source ~/chipyard-mlc/env.sh
make SUB_PROJECT=vcu118 CONFIG=BoomVCU118Config2EntryVPT bitstream
make SUB_PROJECT=vcu118 CONFIG=BoomVCU118Config4EntryVPT bitstream
make SUB_PROJECT=vcu118 CONFIG=BoomVCU118Config8EntryVPT bitstream
make SUB_PROJECT=vcu118 CONFIG=BoomVCU118Config16EntryVPT bitstream
make SUB_PROJECT=vcu118 CONFIG=BoomVCU118Config32EntryVPT bitstream
make SUB_PROJECT=vcu118 CONFIG=BoomVCU118Config64EntryVPT bitstream

compiled_data_txt=~/Desktop/research/saved_chipyard_runs/run_8-8-22/compiled_data.txt

data=(
	"(top) |"
	"BoomTile |"
	"BoomNonBlockingDCache |"
	"MLC |"
	"VPT |"
	"CAT |"
)

files=(
	"./generated-src/chipyard.fpga.vcu118.VCU118FPGATestHarness.BoomVCU118Config2EntryVPT/obj/report/utilization.txt"
	"./generated-src/chipyard.fpga.vcu118.VCU118FPGATestHarness.BoomVCU118Config4EntryVPT/obj/report/utilization.txt"
	"./generated-src/chipyard.fpga.vcu118.VCU118FPGATestHarness.BoomVCU118Config8EntryVPT/obj/report/utilization.txt"
	"./generated-src/chipyard.fpga.vcu118.VCU118FPGATestHarness.BoomVCU118Config16EntryVPT/obj/report/utilization.txt"
	"./generated-src/chipyard.fpga.vcu118.VCU118FPGATestHarness.BoomVCU118Config32EntryVPT/obj/report/utilization.txt"
	"./generated-src/chipyard.fpga.vcu118.VCU118FPGATestHarness.BoomVCU118Config64EntryVPT/obj/report/utilization.txt"
)

for f in "${files[@]}"
do
	echo "----------------------------------------------------------------------" >> $compiled_data_txt
	echo $f >> $compiled_data_txt
	for d in "${data[@]}"
	do	
		grep "$d" $f >> $compiled_data_txt
	done
done

