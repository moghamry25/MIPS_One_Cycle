module Adder(
    in1,in2,out
);

    parameter WIDTH = 32 ;
    input [WIDTH-1:0]in1,in2;
    output [WIDTH-1:0]out;
    assign out = in1 +in2 ; 

endmodule