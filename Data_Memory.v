module Data_Memory(
    A , WD , clk , WE , RD
);
    
parameter WDITH = 32 ;    
input clk , WE ;
input [WDITH-1:0]WD,A;
output reg[WDITH-1:0]RD;

reg [WDITH-1:0]mem[1023:0];

always @(posedge clk) begin
    
    if(WE)begin
        mem[WD] <= A ;
    end
    else begin
        RD <= mem[WD] ;
    end

end

endmodule