module Control_Unit(
    op,funct,MemtoReg,MemWrite,Branch,Jump,ALUControl,ALUSrc,RegDst,RegWrite
);
    
    input [5:0]op,funct;
    output reg MemtoReg,MemWrite,Branch,ALUSrc,RegDst,Jump,RegWrite;
    output reg [2:0]ALUControl;

    reg [1:0]ALUop;


     ALUOP aludecode(funct,ALUop,ALUControl);

    always @(*) begin
        casex(op)

            6'b000_000:begin
                {RegWrite,RegDst,ALUSrc,Branch,MemWrite,MemtoReg,ALUop,Jump} = 9'b1100_00100;
            end
            6'b100_011:begin
                {RegWrite,RegDst,ALUSrc,Branch,MemWrite,MemtoReg,ALUop,Jump} = 9'b1010_01000;
            end
            6'b101_011:begin
                {RegWrite,RegDst,ALUSrc,Branch,MemWrite,MemtoReg,ALUop,Jump} = 9'b0x10_1x000;
            end
            6'b000_100:begin
                {RegWrite,RegDst,ALUSrc,Branch,MemWrite,MemtoReg,ALUop,Jump} = 9'b0x01_0x010;
            end
            6'b001_000:begin
                {RegWrite,RegDst,ALUSrc,Branch,MemWrite,MemtoReg,ALUop,Jump} = 9'b1010_00000;
            end
            6'b000_010:begin
                {RegWrite,RegDst,ALUSrc,Branch,MemWrite,MemtoReg,ALUop,Jump} = 9'b0xxx_0xxx1;
            end
        
                default: begin
                    {RegWrite,RegDst,ALUSrc,Branch,MemWrite,MemtoReg,ALUop,Jump} = 0;
                end
            
        endcase
    end

endmodule