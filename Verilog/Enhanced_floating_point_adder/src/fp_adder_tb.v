`timescale 1ns / 1ps

module fp_adder_tb;

	// Inputs
	reg sign1;
	reg sign2;
	reg [3:0] exp1;
	reg [3:0] exp2;
	reg [7:0] frac1;
	reg [7:0] frac2;

	// Outputs
	wire sign_out;
	wire [3:0] exp_out;
	wire [7:0] frac_out;

	// Instantiate the Unit Under Test (UUT)
	fp_adder uut (
		.sign1(sign1), 
		.sign2(sign2), 
		.exp1(exp1), 
		.exp2(exp2), 
		.frac1(frac1), 
		.frac2(frac2), 
		.sign_out(sign_out), 
		.exp_out(exp_out), 
		.frac_out(frac_out)
	);

	initial
	begin
		#10
		$display("TEST GUARD BIT");
		
		{sign1, exp1, frac1} = {1'b0, 4'b0010, 8'b10000000};
		{sign2, exp2, frac2} = {1'b0, 4'b1010, 8'b10000000};
		#10 $display("|%b|%b|%b|", sign_out, exp_out, frac_out);
		
		{sign1, exp1, frac1} = {1'b0, 4'b0010, 8'b10000000};
		{sign2, exp2, frac2} = {1'b0, 4'b1010, 8'b10000001};
		#10 $display("|%b|%b|%b|", sign_out, exp_out, frac_out);
		
		$display("TEST ROUND BIT");
		
		{sign1, exp1, frac1} = {1'b0, 4'b0010, 8'b11000000};
		{sign2, exp2, frac2} = {1'b0, 4'b1010, 8'b10000000};
		#10 $display("|%b|%b|%b|", sign_out, exp_out, frac_out);
		
		{sign1, exp1, frac1} = {1'b0, 4'b0010, 8'b11000000};
		{sign2, exp2, frac2} = {1'b0, 4'b1010, 8'b10000001};
		#10 $display("|%b|%b|%b|", sign_out, exp_out, frac_out);
		
		$display("TEST STICKY BIT");
		
		{sign1, exp1, frac1} = {1'b0, 4'b0010, 8'b10100000};
		{sign2, exp2, frac2} = {1'b0, 4'b1010, 8'b10000000};
		#10 $display("|%b|%b|%b|", sign_out, exp_out, frac_out);
		
		{sign1, exp1, frac1} = {1'b0, 4'b0010, 8'b10100000};
		{sign2, exp2, frac2} = {1'b0, 4'b1010, 8'b10000001};
		#10 $display("|%b|%b|%b|", sign_out, exp_out, frac_out);
		
		$finish;
	end
      
endmodule

