`timescale 1ns / 1ps

module bshifter8_tb;

	// Inputs
	reg [7:0] a;
	reg [2:0] amt;
	reg lr;

	// Outputs
	wire [7:0] y;

	// Instantiate the Unit Under Test (UUT)
	/*bshifter8 uut (
		.a(a), 
		.amt(amt), 
		.lr(lr), 
		.y(y)
	);*/
	
	bshifter8_r uut (
		.a(a), 
		.amt(amt), 
		.lr(lr), 
		.y(y)
	);

	initial
	begin
		a = 8'b01100000;
		
		lr = 0; // Right rotation
		
		for(amt = 0; amt < 7; amt = amt + 1)
			#10;
		
		#10;
		
		lr = 1; // Left rotation
		
		for(amt = 0; amt < 7; amt = amt + 1)
			#10;
		
		#10;
		
		$stop;
	end
      
endmodule

