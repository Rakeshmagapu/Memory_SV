vlib work
vlog list.svh
vopt tb +cover=fcbest -o nwr_nrd
vsim -coverage nwr_nrd +test_name=nwr_nrd +N=20
coverage save -onexit nwr_nrd.ucdb
do exclusion.do
add wave -r sim:/tb/pif/*
run -all
