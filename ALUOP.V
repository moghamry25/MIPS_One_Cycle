module ALUop(
    input [5:0]func,
    input [1:0]aluop,
    output reg [2:0]op
);
    
    always @(*) begin
        if(aluop == 2'b00)begin
            op = 3'b010 ;
        end
        else if (aluop == 2'b01) begin
            op = 3'b110 ;
        end
        else if (aluop == 2'b10 ) begin
            if (func == 6'b100_000) begin
                op = 3'b010;
            end
            else if (func == 6'b100_010) begin
                op = 3'b110 ;
            end
            else if (func == 6'b100_100) begin
                op = 3'b000 ;
            end
            else if (func == 6'b100_101) begin
                op = 3'b001 ;
            end
            else if (func == 6'b101_010) begin
                op = 3'b111 ;
            end
            else begin
                
            end
        end
        else begin
            
        end
    end

endmodule