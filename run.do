vlib work
vlog list.svh
vsim -novopt -suppress 12110 tb -assertdebug\
+test_name=nwr_nrd +N=15
#add wave -position -insertpoint sim:/tb/pif/
do wave.do
#add wave -r sim:/tb/pif/*
run -all
