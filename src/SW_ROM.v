
module SW_ROM(
    output reg [7:0] Q,
    input [3:0] A,
    input [7:0] mem0,
    input [7:0] mem1,
    input [7:0] mem2,
    input [7:0] mem3,
    input [7:0] mem4,
    input [7:0] mem5,
    input [7:0] mem6,
    input [7:0] mem7,
    input [7:0] mem8,
    input [7:0] mem9,
    input [7:0] memA,
    input [7:0] memB,
    input [7:0] memC,
    input [7:0] memD,
    input [7:0] memE,
    input [7:0] memF
);

    always @(A) 
        case(A)
            4'h0 : Q <= mem0;
            4'h1 : Q <= mem1;
            4'h2 : Q <= mem2;
            4'h3 : Q <= mem3;
            4'h4 : Q <= mem4;
            4'h5 : Q <= mem5;
            4'h6 : Q <= mem6;
            4'h7 : Q <= mem7;
            4'h8 : Q <= mem8;
            4'h9 : Q <= mem9;
            4'hA : Q <= memA;
            4'hB : Q <= memB;
            4'hC : Q <= memC;
            4'hD : Q <= memD;
            4'hE : Q <= memE;
            4'hF : Q <= memF;
    endcase
    
endmodule
