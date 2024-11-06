module MIPS_tb;
    
  logic clk ,rst;
  logic [31:0]Result;

  datapath MIPS(clk,rst,Result)
     
  initial begin
    
    forever begin
        #10 clk = ~clk;
    end
  end

    initial begin

    #160
    $stop;
    end



endmodule