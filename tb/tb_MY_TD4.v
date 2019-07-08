
module tb_MY_TD4();

    reg clk,rst;
    reg [3:0] swin;
    reg[7:0] mem0,mem1,mem2,mem3,mem4,mem5,mem6,mem7;
    reg[7:0] mem8,mem9,memA,memB,memC,memD,memE,memF;
    wire[3:0] led;

    MY_TD4 my_TD4(
        .CLK(clk), .RST(rst), .sw_in(swin),
        .mem0(mem0), .mem1(mem1), .mem2(mem2), .mem3(mem3),
        .mem4(mem4), .mem5(mem5), .mem6(mem6), .mem7(mem7),
        .mem8(mem8), .mem9(mem9), .memA(memA), .memB(memB),
        .memC(memC), .memD(memD), .memE(memE), .memF(memF),
        .led(led)
    );

    always #10
        if(rst == 1'b0)
            clk <= 1'b0;
        else
            clk <= ~clk;

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,my_TD4);
        #0
        rst <= 1'b1;
        swin <= 4'b0000;
        //led less led ticker
        mem0 <= 8'b1011_0011; 
        mem1 <= 8'b1011_0110;
        mem2 <= 8'b1011_1100;
        mem3 <= 8'b1011_1000;
        mem4 <= 8'b1011_1000;
        mem5 <= 8'b1011_1100;
        mem6 <= 8'b1011_0110;
        mem7 <= 8'b1011_0011;
        mem8 <= 8'b1011_0001;
        mem9 <= 8'b1011_0001;
        memA <= 8'b1011_0011;
        memB <= 8'b1011_0110;
        memC <= 8'b1011_1100;
        memD <= 8'b1011_1000;
        memE <= 8'b1011_1000;
        memF <= 8'b1011_0000;
        #30
        rst <= 1'b0;
        #30
        rst <= 1'b1;
        #200
        $finish;
    end


endmodule
