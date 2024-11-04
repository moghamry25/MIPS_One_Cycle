module signextend(
    datain,dataout
);
    input [15:0]datain;
    output [31:0]dataout;

    assign dataout = {{16{datain[15]}},datain}; 
endmodule