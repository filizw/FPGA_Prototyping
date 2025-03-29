`timescale 1ns / 1ps

// 32-bit rotate right circuit
module rotate_right32(
    input [31:0] a,
    input [4:0] amt,
    output [31:0] y
    );

	wire [31:0] s0, s1, s2, s3;

	// Rotate by 1 or 0 bits
	assign s0 = amt[0] ? {a[0], a[31:1]} : a;
	
	// Rotate by 2 or 0 bits
	assign s1 = amt[1] ? {s0[1:0], s0[31:2]} : s0;
	
	// Rotate by 4 or 0 bits
	assign s2 = amt[2] ? {s1[3:0], s1[31:4]} : s1;

	// Rotate by 8 or 0 bits
	assign s3 = amt[3] ? {s2[7:0], s2[31:8]} : s2;

	// Rotate by 16 or 0 bits
	assign y = amt[4] ? {s3[15:0], s3[31:16]} : s3;

endmodule
