`timescale 1ns / 1ps

// 16-bit rotate left circuit
module rotate_left16(
    input [15:0] a,
    input [3:0] amt,
    output [15:0] y
    );

	wire [15:0] s0, s1, s2;

	// Rotate by 1 or 0 bits
	assign s0 = amt[0] ? {a[14:0], a[15]} : a;
	
	// Rotate by 2 or 0 bits
	assign s1 = amt[1] ? {s0[13:0], s0[15:14]} : s0;
	
	// Rotate by 4 or 0 bits
	assign s2 = amt[2] ? {s1[11:0], s1[15:12]} : s1;
	
	// Rotate by 8 or 0 bits
	assign y = amt[3] ? {s2[7:0], s2[15:8]} : s2;

endmodule
