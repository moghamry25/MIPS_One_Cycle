vlib work
vlog -f lists.list
vsim -voptargs=+acc work.MIPS_tb
#add wave *
add wave -position insertpoint sim:/MIPS_tb/MIPS/*
run -all
#quit -sim