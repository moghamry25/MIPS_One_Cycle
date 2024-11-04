module DFF(
    D,Q,clk,rst
);
parameter WDITH = 32 ;  
input [WDITH-1:0]D;
input clk,rst;
output reg[WDITH-1:0]Q;

always @(posedge clk) begin
    if (!rst) begin
        Q <= 0 ;
    end
    else begin
        Q <= D ;
    end
end
endmodule