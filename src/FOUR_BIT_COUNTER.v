module FOUR_BIT_COUNTER(
    input CLK,
    input RST,
    input [3:0] DIN,
    input ENB_LD,
    input ENB_CNT,
    output reg [3:0]Q
);

    always @(posedge CLK or negedge RST) begin
        if(RST == 1'b0) begin
            Q <= 4'b0000;
        end else if(ENB_LD == 1'b0) begin
            Q <= DIN;
        end else if(ENB_CNT == 1'b0) begin
            Q <= Q + 1'b1;
        end else begin
            Q <= Q;
        end
    end

endmodule
