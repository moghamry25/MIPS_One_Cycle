module datapath(
    clk,rst,Result
);
    input clk,rst;
    output Result;
    parameter WIDTH = 32 ;
    wire jump; 
    wire [WIDTH-1:0]input1_mux1,out_mux1;
    wire [27:0]OUT_SHIFTER1;
    wire [WIDTH-1:0]PC_plus4;
    wire MemtoReg,MemWrite,Branch,Jump,ALUControl,ALUSrc,RegDst,RegWrite;
    Control_Unit CPU(,,MemtoReg,MemWrite,Branch,Jump,ALUControl,ALUSrc,RegDst,RegWrite);
    mux2_1 #(.WIDTH(WIDTH))mux1(input1_mux1,{PC_plus4[31:28],OUT_SHIFTER1},jump,out_mux1);

    wire [WIDTH-1:0]PC_OUT;
    DFF #(.WIDTH(WIDTH))PC(out_mux1,PC_OUT,clk,rst);

    
    Adder #(.WIDTH(WIDTH))PCPLUS4(PC_OUT,4,PC_plus4);

    wire [WIDTH-1:0]instr;
    Instruction_Memory #(.WIDTH(WIDTH))INSTR_MEM(PC_OUT,instr);

    
    shift2 #(.WIDTH(26))SHIFTER_JUMP(instr[25:0],OUT_SHIFTER1);

    wire [4:0]WriteReg;
    mux2_1 #(.WIDTH(5))mux2(instr[20:16],instr[15:11],RegDst,WriteReg);

    wire [WIDTH-1:0]SignImm,SrcB,wiretomux3;
    mux2_1 #(.WDITH(WIDTH))mux3(wiretomux3,SignImm,ALUSrc,SrcB);

    
    signextend SIGNEXTENDED(instr[15:0],SignImm);

    wire [WIDTH-1:0]OUT_shifter2; 
    shift2 #(.WIDTH(WIDTH))SHIFTER_BRANCH(SignImm,OUT_shifter2);

    wire [WIDTH-1:0]PCbranch;
    Adder #(.WDITH(WIDTH))PCBRANCH(OUT_shifter2,PC_plus4,PCbranch);  

    wire [WIDTH-1:0]SrcA;
    Register_File REg_FILE(instr[25:21],instr[20:16],WriteReg,Result,clk,RegWrite,SrcA,wiretomux3);

    wire [2:0]opsel;
    wire [WIDTH-1:0]OUT_ALU;
    ALU #(.WIDTH(WIDTH))alu(SrcA,SrcB,ALUControl,OUT_ALU,ZERO);

    wire PCSrc;
    assign PCSrc = Branch & ZERO ;
    mux2_1 #(.WIDTH(WIDTH))mux4(PC_plus4,PCbranch,PCSrc,input1_mux1);

    wire [WIDTH-1:0]ReadData;
    Data_Memory #(.WIDTH(WIDTH))DataMEM(OUT_ALU,wiretomux3,clk,MemWrite,ReadData);

    mux2_1 #(.WIDTH(WIDTH))mux5(OUT_ALU,ReadData,MemtoReg,Result);

endmodule