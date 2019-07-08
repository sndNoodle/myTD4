
module tb_SW_ROM();
    wire[7:0] Q;
    reg[3:0] A; 

    SW_ROM rom(
        .Q(Q),
        .A(A),
        .mem0(8'h00),
        .mem1(8'h01),
        .mem2(8'h02),
        .mem3(8'h03),
        .mem4(8'h04),
        .mem5(8'h05),
        .mem6(8'h06),
        .mem7(8'h07),
        .mem8(8'h08),
        .mem9(8'h09),
        .memA(8'h0A),
        .memB(8'h0B),
        .memC(8'h0C),
        .memD(8'h0D),
        .memE(8'h0E),
        .memF(8'h0F)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,rom);
        #0
        A <= 4'b0000;
        #200
        $finish;
    end

    always #10
        A <= A + 4'b0001;

endmodule
