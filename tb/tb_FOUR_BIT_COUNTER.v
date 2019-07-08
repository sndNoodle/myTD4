
module tb_FOUR_BIT_COUNTER();

    reg clk;
    reg rst;
    reg [3:0] din;
    reg enb_ld;
    reg enb_cnt;
    wire [3:0] q;

    FOUR_BIT_COUNTER fourBitCntr(
        .CLK(clk),
        .RST(rst),
        .DIN(din[3:0]),
        .ENB_LD(enb_ld),
        .ENB_CNT(enb_cnt),
        .Q(q[3:0])
    );

    always #10
        if(rst == 1'b0)
            clk <= 1'b0;
        else
            clk <= ~clk;

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,fourBitCntr);
        #0
        rst <= 1'b1;
        din <= 4'b0000;
        enb_ld <= 1'b1;
        enb_cnt <= 1'b1;
        din <= 1010; 

        #30
        rst <= 1'b0;

        #30 
        rst <= 1'b1;

        #50
        enb_ld  <= 1'b0;
        enb_cnt <= 1'b1;

        #100
        enb_ld  <= 1'b1;
        enb_cnt <= 1'b0;

        #100
        enb_ld  <= 1'b0;
        enb_cnt <= 1'b0;


        #100
        $finish;
    end

endmodule
