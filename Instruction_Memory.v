module Instruction_Memory(
    A , RD 
);
    
    parameter WIDTH = 32 ;
    input [WIDTH-1:0]A;
    output [WIDTH-1:0]RD;

    reg [WIDTH-1:0]mem[255:0];
    initial begin
     $readmemh("MEM_INSTR.dat",mem);   
    end
    
    assign RD = mem[A];

endmodule