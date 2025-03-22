`timescale 1ns / 1ps

// 4-bit greater-than circuit (a > b)
module gt4(
    input [3:0] a,
    input [3:0] b,
    output agtb
    );

	wire gt_high, gt_low, eq_high;
	
	// Compare two higher bits
	gt2 gt_high_unit(.a(a[3:2]), .b(b[3:2]), .agtb(gt_high));
	eq2 eq_high_unit(.a(a[3:2]), .b(b[3:2]), .aeqb(eq_high));
	
	// Compare two lower bits
	gt2 gt_low_unit(.a(a[1:0]), .b(b[1:0]), .agtb(gt_low));
	
	assign agtb = gt_high | (eq_high & gt_low);

endmodule
