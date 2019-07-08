
module FOUR_BIT_ADDER(
    input [3:0] INA,
    input [3:0] INB,
    output [3:0] OUT,
    output CARRY
);
    wire [4:0] res;
    assign res = INA + INB;
    assign OUT[3:0] = res[3:0];
    assign CARRY = res[4]; 
    
endmodule
