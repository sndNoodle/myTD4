

module tb_DECODER();

    reg [3:0] opcode;
    reg cflg;
    wire selA;
    wire selB;
    wire [3:0] ldb;

    DECODER decoder(
        .OPCODE(opcode),
        .CFLG(cflg),
        .SELA(selA),
        .SELB(selB),
        .LDB(ldb)
    );

    always #50
        opcode <= opcode + 4'b0001;

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0,decoder);

        #0
        opcode <= 4'b0000;
        cflg   <= 1'b0;

        #50
        opcode <= 4'b0001;
        cflg   <= 1'b0;
        
        #50
        opcode <= 4'b0010;
        cflg   <= 1'b0;

        #50
        opcode <= 4'b0011;
        cflg   <= 1'b0;
            
        #50
        opcode <= 4'b0100;
        cflg   <= 1'b0;

        #50
        opcode <= 4'b0101;
        cflg   <= 1'b0;
        
        #50
        opcode <= 4'b0110;
        cflg   <= 1'b0;
        
        #50
        opcode <= 4'b0111;
        cflg   <= 1'b0;

        #50
        opcode <= 4'b1001;
        cflg   <= 1'b0;

        #50
        opcode <= 4'b1011;
        cflg   <= 1'b0;

        #50
        opcode <= 4'b1110;
        cflg   <= 1'b1;

        #50
        opcode <= 4'b1110;
        cflg   <= 1'b0;

        #50
        opcode <= 4'b1111;
        cflg   <= 1'b0;
    
        #50
        $finish;
    end
    
endmodule
