`timescale 1ns / 1ps

// 8-bit barrel shifter that can perform left or right rotation
module bshifter8(
    input [7:0] a,
    input [2:0] amt,
    input lr,
    output [7:0] y
    );

	wire [7:0] left, right;

	rotate_left8 left_unit(.a(a), .amt(amt), .y(left));
	rotate_right8 right_unit(.a(a), .amt(amt), .y(right));

	// 2-to-1 multiplexer
	assign y = lr ? left : right;

endmodule
