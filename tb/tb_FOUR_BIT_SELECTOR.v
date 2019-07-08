
module tb_FOUR_BIT_SELECTOR();
    reg A;
    reg B;
    reg[3:0] in00;
    reg[3:0] in01;
    reg[3:0] in10;
    reg[3:0] in11;
    wire[3:0] out;

    FOUR_BIT_SELECTOR select(
        .SELA(A),
        .SELB(B),
        .IN00(in00),
        .IN01(in01),
        .IN10(in10),
        .IN11(in11),
        .OUT(out)
    ); 

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,select);

        #0
        A <= 1'b0;
        B <= 1'b0;
        in00 <= 4'b0001;
        in01 <= 4'b0010;
        in10 <= 4'b0100;
        in11 <= 4'b1000;
        #30
        A <= 1'b1;
        B <= 1'b0;

        #30
        A <= 1'b0;
        B <= 1'b1;
        
        #30
        A <= 1'b1;
        B <= 1'b1;

        #30
        $finish;
    end

endmodule
