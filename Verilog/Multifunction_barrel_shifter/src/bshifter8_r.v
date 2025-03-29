`timescale 1ns / 1ps

// 8-bit barrel shifter that can perform left or right rotation, implemented using pre- and post-reversing ciruits
module bshifter8_r(
    input [7:0] a,
    input [2:0] amt,
    input lr,
    output [7:0] y
    );

	wire [7:0] a_rev, in, out, out_rev;

	// Pre-reversing
	reverse8 reverse_unit0(.a(a), .y(a_rev));
	
	// Post-reversing
	reverse8 reverse_unit1(.a(out), .y(out_rev));

	rotate_right8 rotate_right_unit(.a(in), .amt(amt), .y(out));
	
	assign in = lr ? a_rev : a;
	assign y = lr ? out_rev : out;

endmodule
