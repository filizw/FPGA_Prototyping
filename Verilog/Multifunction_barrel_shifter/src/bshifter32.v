`timescale 1ns / 1ps

// 32-bit barrel shifter that can perform left or right rotation
module bshifter32(
    input [31:0] a,
    input [4:0] amt,
    input lr,
    output [31:0] y
    );

	wire [31:0] left, right;

	rotate_left32 left_unit(.a(a), .amt(amt), .y(left));
	rotate_right32 right_unit(.a(a), .amt(amt), .y(right));

	// 2-to-1 multiplexer
	assign y = lr ? left : right;

endmodule
