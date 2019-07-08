
module tb_FOUR_BIT_ADDER();

    reg [3:0] inA;
    reg [3:0] inB;
    wire [3:0] out;
    wire c;

    FOUR_BIT_ADDER adder(
        .INA(inA),
        .INB(inB),
        .OUT(out),
        .CARRY(c)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,adder);
        #0
        inA <= 4'b0000;
        inB <= 4'b0000;

        #10
        inA <= 4'b0101;
        inB <= 4'b0010;
    
        #10
        inA <= 4'b1111;
        inB <= 4'b1111;

        #10
        $finish;
    end

endmodule
