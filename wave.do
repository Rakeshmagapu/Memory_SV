onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/pif/clk
add wave -noupdate /tb/pif/rst
add wave -noupdate /tb/pif/wr_rd
add wave -noupdate /tb/pif/valid
add wave -noupdate /tb/pif/ready
add wave -noupdate /tb/pif/addr
add wave -noupdate /tb/pif/wdata
add wave -noupdate /tb/pif/rdata
add wave -noupdate /tb/pif/bfm_cb/wr_rd
add wave -noupdate /tb/pif/bfm_cb/valid
add wave -noupdate /tb/pif/bfm_cb/wdata
add wave -noupdate /tb/pif/bfm_cb/addr
add wave -noupdate /tb/pif/bfm_cb/rdata
add wave -noupdate /tb/pif/bfm_cb/ready
add wave -noupdate /tb/pif/bfm_cb/bfm_cb_event
add wave -noupdate /tb/pif/mon_cb/wr_rd
add wave -noupdate /tb/pif/mon_cb/addr
add wave -noupdate /tb/pif/mon_cb/wdata
add wave -noupdate /tb/pif/mon_cb/rdata
add wave -noupdate /tb/pif/mon_cb/valid
add wave -noupdate /tb/pif/mon_cb/ready
add wave -noupdate /tb/pif/mon_cb/mon_cb_event
add wave -noupdate /tb/uut/RESET
add wave -noupdate /tb/uut/PRESET
add wave -noupdate /tb/uut/HANDSHAKING
add wave -noupdate /tb/uut/WRITE
add wave -noupdate /tb/uut/READ
add wave -noupdate /tb/uut/HAND
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ns} {9450 ns}
