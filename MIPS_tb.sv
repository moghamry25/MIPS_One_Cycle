module MIPS_tb;
    
  logic clk ,rst;
  logic [31:0]Result;

  datapath MIPS(clk,rst,Result);
     
  initial begin
    clk = 0 ;
    forever begin
        #10 clk = ~clk;
    end
  end

    initial begin

    rst = 0 ;
    @(negedge clk);    
    rst = 1 ;
    #160;
    $stop;
    end



endmodule