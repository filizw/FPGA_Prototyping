`timescale 1ns / 1ps

module int_to_fp_tb;

	// Inputs
	reg [7:0] integ;

	// Outputs
	wire sign;
	wire [3:0] exp;
	wire [7:0] frac;

	// Instantiate the Unit Under Test (UUT)
	int_to_fp uut (
		.integ(integ), 
		.sign(sign), 
		.exp(exp), 
		.frac(frac)
	);

	initial
	begin
		for(integ = 8'h0; integ < 8'hff; integ = integ + 1)
			#5;
		
		$finish;
	end
	
	initial
	begin
		$monitor("%b -> |%b|%b|%b|", integ, sign, exp, frac);
	end
      
endmodule

