`timescale 1ns / 1ps

// 32-bit barrel shifter that can perform left or right rotation, implemented using pre- and post-reversing ciruits
module bshifter32_r(
    input [31:0] a,
    input [4:0] amt,
    input lr,
    output [31:0] y
    );

	wire [31:0] a_rev, in, out, out_rev;

	// Pre-reversing
	reverse8 reverse_unit0(.a(a[7:0]), .y(a_rev[31:24]));
	reverse8 reverse_unit1(.a(a[15:8]), .y(a_rev[23:16]));
	reverse8 reverse_unit2(.a(a[23:16]), .y(a_rev[15:8]));
	reverse8 reverse_unit3(.a(a[31:24]), .y(a_rev[7:0]));
	
	// Post-reversing
	reverse8 reverse_unit4(.a(out[7:0]), .y(out_rev[31:24]));
	reverse8 reverse_unit5(.a(out[15:8]), .y(out_rev[23:16]));
	reverse8 reverse_unit6(.a(out[23:16]), .y(out_rev[15:8]));
	reverse8 reverse_unit7(.a(out[31:24]), .y(out_rev[7:0]));

	rotate_right32 rotate_right_unit(.a(in), .amt(amt), .y(out));
	
	assign in = lr ? a_rev : a;
	assign y = lr ? out_rev : out;

endmodule
