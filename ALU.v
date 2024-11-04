module ALU(
    A,B,SELECT,OUT,ZERO
);
    
    parameter WIDTH = 32 ;

    input [WIDTH-1:0]A,B;
    input [2:0]SELECT;
    output reg[WDITH-1:0]OUT;
    output reg ZERO;

    always @(*) begin
        case (SELECT)
            3'b000:begin
                OUT = A & B ;
            end
            3'b001:begin
                OUT = A | B ;
            end
            3'b010:begin
                OUT = A + B ;
            end
            3'b110:begin
                OUT = A - B ; 
            end
            3'b111:begin
                OUT = ( A < B ) 1 : 0 ;
            end
        endcase
        if(!OUT)begin
            ZERO = 1 ; 
        end
        else begin
            ZERO = 0 ;
        end
    end

endmodule