`timescale 1ns / 1ps

// 16-bit barrel shifter that can perform left or right rotation
module bshifter16(
    input [15:0] a,
    input [3:0] amt,
    input lr,
    output [15:0] y
    );

	wire [15:0] left, right;

	rotate_left16 left_unit(.a(a), .amt(amt), .y(left));
	rotate_right16 right_unit(.a(a), .amt(amt), .y(right));

	// 2-to-1 multiplexer
	assign y = lr ? left : right;

endmodule
