`timescale 1ns / 1ps

// 2-bit greater-than circuit (a > b)
module gt2(
    input [1:0] a,
    input [1:0] b,
    output agtb
    );
	
	assign agtb = (a[1] & ~b[1]) | (a[0] & ~b[1] & ~b[0]) | (a[1] & a[0] & ~b[0]);

endmodule
