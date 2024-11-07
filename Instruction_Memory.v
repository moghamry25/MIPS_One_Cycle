module Instruction_Memory(
    A , RD 
);
    
    parameter WIDTH = 32 ;
    input [WIDTH-1:0]A;
    output [WIDTH-1:0]RD;

    reg [WIDTH-1:0]mem[1023:0];
    initial 
     $readmemh("mem.dat",mem);
   
    
    
    assign RD = mem[A];

endmodule