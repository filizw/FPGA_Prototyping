`timescale 1ns / 1ps

module fp_gt_tb;

	// Inputs
	reg sign1;
	reg sign2;
	reg [3:0] exp1;
	reg [3:0] exp2;
	reg [7:0] frac1;
	reg [7:0] frac2;

	// Output
	wire gt;

	// Instantiate the Unit Under Test (UUT)
	fp_gt uut (
		.sign1(sign1), 
		.sign2(sign2), 
		.exp1(exp1), 
		.exp2(exp2), 
		.frac1(frac1), 
		.frac2(frac2), 
		.gt(gt)
	);

	initial
	begin
		{sign1, exp1, frac1} = {1'd0, 4'd0, 8'd0};
		{sign2, exp2, frac2} = {1'd0, 4'd0, 8'd0};
		
		#10;
		
		{sign1, exp1, frac1} = {1'd1, 4'd5, 8'd100};
		{sign2, exp2, frac2} = {1'd0, 4'd1, 8'd9};
		
		#10;
		
		{sign1, exp1, frac1} = {1'd1, 4'd5, 8'd100};
		{sign2, exp2, frac2} = {1'd1, 4'd1, 8'd9};
		
		#10;
		
		{sign1, exp1, frac1} = {1'd0, 4'd5, 8'd100};
		{sign2, exp2, frac2} = {1'd1, 4'd1, 8'd9};
		
		#10;
		
		{sign1, exp1, frac1} = {1'd0, 4'd3, 8'd87};
		{sign2, exp2, frac2} = {1'd0, 4'd2, 8'd100};
		
		#10;
		
		{sign1, exp1, frac1} = {1'd0, 4'd2, 8'd87};
		{sign2, exp2, frac2} = {1'd0, 4'd3, 8'd100};
		
		#10;
		
		{sign1, exp1, frac1} = {1'd0, 4'd2, 8'd87};
		{sign2, exp2, frac2} = {1'd0, 4'd2, 8'd100};
		
		#10;
		
		{sign1, exp1, frac1} = {1'd0, 4'd2, 8'd87};
		{sign2, exp2, frac2} = {1'd0, 4'd2, 8'd50};
		
		#10;
		
		$finish;
	end
	
	initial
	begin
		$monitor("|%b|%b|%b| > |%b|%b|%b| ? %b", sign1, exp1, frac1, sign2, exp2, frac2, gt);
	end
      
endmodule

