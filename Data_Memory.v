module Data_Memory(
    A , WD , clk , WE , RD
);
    
parameter WIDTH = 32 ;    
input clk , WE ;
input [WIDTH-1:0]WD,A;
output [WIDTH-1:0]RD;

reg [WIDTH-1:0]mem[1023:0];

assign  RD = mem[A] ;

always @(posedge clk) begin
    
    if(WE)begin
        mem[WD] <= A ;
    end
    else begin
       
    end

end

endmodule