module datapath(
    clk,rst,Result
);
    input clk,rst;
    output [31:0]Result;
    parameter WIDTH = 32 ;
     
    wire [WIDTH-1:0]input1_mux1,out_mux1;
   
    wire [WIDTH-1:0]PC_plus4;
    wire [WIDTH-1:0]instr;
    wire MemtoReg,MemWrite,Branch,Jump,ALUSrc,RegDst,RegWrite;
    wire [2:0]ALUControl;
    Control_Unit CPU(instr[31:26],instr[5:0],MemtoReg,MemWrite,Branch,Jump,ALUControl,ALUSrc,RegDst,RegWrite);
       
    wire [31:0]addr;
    mux2_1 #(.WIDTH(WIDTH))mux1(input1_mux1,addr,Jump,out_mux1);
   
   assign addr = {PC_plus4[31:28],instr[25:0],2'b00};
    wire [WIDTH-1:0]PC_OUT;
    DFF #(.WIDTH(WIDTH))PC(out_mux1,PC_OUT,clk,rst);

    
    Adder #(.WIDTH(WIDTH))PCPLUS4(PC_OUT,4,PC_plus4);

    
    Instruction_Memory #(.WIDTH(WIDTH))INSTR_MEM(PC_OUT,instr);

    

    wire [4:0]WriteReg;
    mux2_1 #(.WIDTH(5))mux2(instr[20:16],instr[15:11],RegDst,WriteReg);

    wire [WIDTH-1:0]SignImm,SrcB,wiretomux3;
    mux2_1 #(.WIDTH(WIDTH))mux3(wiretomux3,SignImm,ALUSrc,SrcB);

    
    signextend SIGNEXTENDED(instr[15:0],SignImm);

    wire [WIDTH-1:0]OUT_shifter2; 
    shift2 #(.WIDTH(WIDTH))SHIFTER_BRANCH(SignImm,OUT_shifter2);

    wire [WIDTH-1:0]PCbranch;
    Adder #(.WIDTH(WIDTH))PCBRANCH(OUT_shifter2,PC_plus4,PCbranch);  

    wire [WIDTH-1:0]SrcA;
    Register_File REg_FILE(instr[25:21],instr[20:16],WriteReg,Result,clk,rst,RegWrite,SrcA,wiretomux3);

    
    wire [WIDTH-1:0]OUT_ALU;
    ALU #(.WIDTH(WIDTH))alu(SrcA,SrcB,ALUControl,OUT_ALU,ZERO);

    wire PCSrc;
    assign PCSrc = Branch & ZERO ;
    mux2_1 #(.WIDTH(WIDTH))mux4(PC_plus4,PCbranch,PCSrc,input1_mux1);

    wire [WIDTH-1:0]ReadData;
    Data_Memory #(.WIDTH(WIDTH))DataMEM(OUT_ALU,wiretomux3,clk,MemWrite,ReadData);

    mux2_1 #(.WIDTH(WIDTH))mux5(OUT_ALU,ReadData,MemtoReg,Result);

endmodule