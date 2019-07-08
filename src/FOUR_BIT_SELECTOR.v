module FOUR_BIT_SELECTOR(
    input SELA,
    input SELB,
    input [3:0] IN00,
    input [3:0] IN01,
    input [3:0] IN10,
    input [3:0] IN11,
    output [3:0] OUT
);

    assign OUT =  (SELA)? (SELB)? IN11 : IN01 :
                          (SELB)? IN10 : IN00;

endmodule
