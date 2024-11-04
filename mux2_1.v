module mux2_1(
    A,B,SELECT,OUT 
);

  parameter WIDTH = 1 ;
  //parameter WDITH_SELECTION = $clog2(WDITH) ;

  input [WDITH-1:0]A,B;
  input SELECT;
  output [WDITH-1:0]OUT;

  assign OUT = (SELECT) B : A;   
endmodule