`timescale 1ns / 1ps

// 16-bit barrel shifter that can perform left or right rotation, implemented using pre- and post-reversing ciruits
module bshifter16_r(
    input [15:0] a,
    input [3:0] amt,
    input lr,
    output [15:0] y
    );

	wire [15:0] a_rev, in, out, out_rev;

	// Pre-reversing
	reverse8 reverse_unit0(.a(a[7:0]), .y(a_rev[15:8]));
	reverse8 reverse_unit1(.a(a[15:8]), .y(a_rev[7:0]));
	
	// Post-reversing
	reverse8 reverse_unit2(.a(out[7:0]), .y(out_rev[15:8]));
	reverse8 reverse_unit3(.a(out[15:8]), .y(out_rev[7:0]));

	rotate_right16 rotate_right_unit(.a(in), .amt(amt), .y(out));
	
	assign in = lr ? a_rev : a;
	assign y = lr ? out_rev : out;

endmodule
