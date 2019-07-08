
module DECODER(
    input [3:0] OPCODE,
    input CFLG,
    output reg SELA,
    output reg SELB,
    output reg [3:0] LDB
);
/*
    Data Selector
        A  B  
        0  0  Reg A
        1  0  Reg B
        0  1  Input
        1  1  4'b0000

    LD
        4'b1110 : Reg A
        4'b1101 : Reg B
        4'b1011 : Output LED
        4'b0111 ; PC

*/

    always @ (OPCODE) begin
        case(OPCODE)
            4'b0000 : begin //ADD A,Im
                LDB  <= 4'b1110;
                SELA <= 1'b0;
                SELB <= 1'b0;
            end
            4'b0001 : begin //MOV A,B
                LDB  <=  4'b1110;
                SELA <= 1'b1;
                SELB <= 1'b0;
            end
            4'b0010 : begin //IN  A
                LDB  <= 4'b1110;
                SELA <= 1'b0;
                SELB <= 1'b1;
            end
            4'b0011 : begin //MOV A,Im
                LDB  <= 4'b1110;
                SELA <= 1'b1;
                SELB <= 1'b1;
            end
            4'b0100 : begin //MOV B,A
                LDB  <= 4'b1101;
                SELA <= 1'b0;
                SELB <= 1'b0;
            end
            4'b0101 : begin //ADD B,Im
                LDB  <= 4'b1101;
                SELA <= 1'b1;
                SELB <= 1'b0;
            end
            4'b0110 : begin //IN B
                LDB  <= 4'b1101;
                SELA <= 1'b0;
                SELB <= 1'b1;
            end
            4'b0111 : begin //MOV B,Im
                LDB  <= 4'b1101;
                SELA <= 1'b1;
                SELB <= 1'b1;
            end
            4'b1001 : begin //OUT B
                LDB  <= 4'b1011;
                SELA <= 1'b1;
                SELB <= 1'b0;
            end
            4'b1011 : begin //OUT Im
                LDB  <= 4'b1011;
                SELA <= 1'b1;
                SELB <= 1'b1;
            end
            4'b1110 : begin//JNC Im
                if(CFLG == 1'b0)begin
                    LDB  <= 4'b0111;
                    SELA <= 1'b1;
                    SELB <= 1'b1;
                end else begin
                    LDB  <= 4'b1111;
                    SELA <= 1'b0;
                    SELB <= 1'b0;
                end
            end
            4'b1111 : begin //JMP Im
                LDB  <= 4'b0111;
                SELA <= 1'b1;
                SELB <= 1'b1;
            end
            default : begin
                LDB  <= LDB;
                SELA <= SELA;
                SELB <= SELB;
            end
        endcase
    end

endmodule
