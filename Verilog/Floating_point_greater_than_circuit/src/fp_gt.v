`timescale 1ns / 1ps

// Floating-point greater-than circuit
// Both exponent and significand fields are in unsigned format
module fp_gt(
    input sign1,
    input sign2,
    input [3:0] exp1,
    input [3:0] exp2,
    input [7:0] frac1,
    input [7:0] frac2,
    output reg gt
    );

	always @*
	begin
		// First compare signs
		if(~sign1 & ~sign2) // Two positive numbers
			gt = {exp1, frac1} > {exp2, frac2};
		else if(sign1 & sign2) // Two negative numbers
			gt = {exp1, frac1} < {exp2, frac2};
		else // Different signs
			gt = ~sign1;
	end

endmodule
