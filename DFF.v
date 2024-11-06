module DFF(
    D,Q,clk,rst
);
parameter WIDTH = 32 ;  
input [WIDTH-1:0]D;
input clk,rst;
output reg[WIDTH-1:0]Q;

always @(posedge clk) begin
    if (!rst) begin
        Q <= 0 ;
    end
    else begin
        Q <= D ;
    end
end
endmodule