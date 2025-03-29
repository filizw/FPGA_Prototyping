`timescale 1ns / 1ps

// 8-bit rotate left circuit
module rotate_left8(
    input [7:0] a,
    input [2:0] amt,
    output [7:0] y
    );

	wire [7:0] s0, s1;

	// Rotate by 1 or 0 bits
	assign s0 = amt[0] ? {a[6:0], a[7]} : a;
	
	// Rotate by 2 or 0 bits
	assign s1 = amt[1] ? {s0[5:0], s0[7:6]} : s0;
	
	// Rotate by 4 or 0 bits
	assign y = amt[2] ? {s1[3:0], s1[7:4]} : s1;

endmodule
