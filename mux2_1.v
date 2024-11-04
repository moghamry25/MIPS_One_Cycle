module mux2_1(
    A,B,SELECT,OUT 
);

  parameter WIDTH = 1 ;
  //parameter WIDTH_SELECTION = $clog2(WIDTH) ;

  input [WIDTH-1:0]A,B;
  input SELECT;
  output [WIDTH-1:0]OUT;

  assign OUT = (SELECT) ? B : A;   
endmodule