vlib work
vlog -f list.list 
vsim -voptargs=+acc work.MIPS_tb
add wave *
run -all
#quit -sim