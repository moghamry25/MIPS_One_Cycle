module shift2(
    datain,dataout
);
    parameter WIDTH = 32 ;

    input [WIDTH-1:0]datain;
    output [WIDTH-1:0]dataout;

    assign dataout = datain << 2 ;
endmodule