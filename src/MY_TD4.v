

module MY_TD4(
    input CLK,
    input RST,
    input[3:0] sw_in,
    input[7:0] mem0, 
    input[7:0] mem1,
    input[7:0] mem2,
    input[7:0] mem3,
    input[7:0] mem4,
    input[7:0] mem5,
    input[7:0] mem6,
    input[7:0] mem7,
    input[7:0] mem8,
    input[7:0] mem9,
    input[7:0] memA,
    input[7:0] memB,
    input[7:0] memC,
    input[7:0] memD,
    input[7:0] memE,
    input[7:0] memF,
    output[3:0] led
);

    wire [3:0] romAddr;
    wire [7:0] romData;
    reg cal_reg;
    wire dec_selA;
    wire dec_selB;
    wire [3:0] ldb;
    wire [3:0] alu_out;
    wire [3:0] regA_out;
    wire [3:0] regB_out;
    wire [3:0] datsel_out;    
    wire [3:0] Im;

    SW_ROM rom(
        .Q( romData),
        .A( romAddr),
        .mem0( mem0[7:0]), 
        .mem1( mem1[7:0]),   
        .mem2( mem2[7:0]),
        .mem3( mem3[7:0]),
        .mem4( mem4[7:0]),
        .mem5( mem5[7:0]),
        .mem6( mem6[7:0]),
        .mem7( mem7[7:0]),
        .mem8( mem8[7:0]),
        .mem9( mem9[7:0]),
        .memA( memA[7:0]),
        .memB( memB[7:0]),
        .memC( memC[7:0]),
        .memD( memD[7:0]),
        .memE( memE[7:0]),
        .memF( memF[7:0])
    );

    DECODER decoder(
        .OPCODE(romData[7:4]),
        .CFLG(cal_reg),
        .SELA(dec_selA),
        .SELB(dec_selB),
        .LDB(ldb[3:0])
    );

    FOUR_BIT_COUNTER regA(
        .CLK(CLK),
        .RST(RST),
        .DIN(alu_out[3:0]),
        .ENB_LD(ldb[0]),
        .ENB_CNT(1'b1),
        .Q(regA_out[3:0])
    );

    FOUR_BIT_COUNTER regB(
        .CLK(CLK),
        .RST(RST),
        .DIN(alu_out[3:0]),
        .ENB_LD(ldb[1]),
        .ENB_CNT(1'b1),
        .Q(regB_out[3:0])
    );

    FOUR_BIT_COUNTER out_led(
        .CLK(CLK),
        .RST(RST),
        .DIN(alu_out[3:0]),
        .ENB_LD(ldb[2]),
        .ENB_CNT(1'b1),
        .Q(led[3:0])
    );

    FOUR_BIT_COUNTER programCntr(
        .CLK(CLK),
        .RST(RST),
        .DIN(alu_out[3:0]),
        .ENB_LD(ldb[3]),
        .ENB_CNT(1'b0),
        .Q(romAddr[3:0])
    );

    FOUR_BIT_SELECTOR datSel(
        .SELA(dec_selA),
        .SELB(dec_selB),
        .IN00(regA_out[3:0]),
        .IN01(regB_out[3:0]),
        .IN10(romData[3:0]),
        .IN11(4'b0000),
        .OUT(datsel_out[3:0])
    );
    

    FOUR_BIT_ADDER ALU(
        .INA(datsel_out[3:0]),
        .INB(romData[3:0]),
        .OUT(alu_out[3:0]),
        .CARRY(cal_out)
    );

    always @(posedge CLK or negedge RST)
        if(RST == 1'b0)
            cal_reg <= 1'b0;
        else
            cal_reg <= cal_out;

endmodule
