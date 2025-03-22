`timescale 1ns / 1ps

// 2-bit equality comparator (a = b)
module eq2(
    input [1:0] a,
    input [1:0] b,
    output aeqb
    );

	assign aeqb = &(~(a ^ b));

endmodule
