module Register_File (
    input [4:0] A1, A2, A3,
    input [31:0] WD3,
    input clk,rst, WE3,
    output reg [31:0] RD1, RD2
);

    reg [31:0] Register_File [31:0];

    always @(*) begin
        RD1 = Register_File[A1];
        RD2 = Register_File[A2];
    end
    initial begin
           $writememh("Reg_contents.hex", Register_File); 
    end
    integer i = 0;
    always @(posedge clk) begin
        if(!rst)begin
            for ( i=0 ; i < 32 ; i = i + 1 ) begin
                Register_File[i] <= 0;
            end
        end
        else if (WE3) begin
            Register_File[A3] <= WD3;
        end
    end

endmodule
