vlib work
vlog Adder.v ALU.v ALUOP.v Control_Unit.v Data_Memory.v datapath.v DFF.v Instruction_Memory.v mux2_1.v Register_File.v shift2.v signextend.v MIPS_tb.sv 
vsim -voptargs=+acc work.MIPS_tb
add wave *
run -all
quit -sim