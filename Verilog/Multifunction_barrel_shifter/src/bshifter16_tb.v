`timescale 1ns / 1ps

module bshifter16_tb;

	// Inputs
	reg [15:0] a;
	reg [3:0] amt;
	reg lr;

	// Outputs
	wire [15:0] y;

	// Instantiate the Unit Under Test (UUT)
	/*bshifter16 uut (
		.a(a), 
		.amt(amt), 
		.lr(lr), 
		.y(y)
	);*/
	
	bshifter16_r uut (
		.a(a), 
		.amt(amt), 
		.lr(lr), 
		.y(y)
	);

	initial
	begin
		a = 16'h6000;
		
		lr = 0; // Right rotation
		
		for(amt = 0; amt < 15; amt = amt + 1)
			#10;
		
		#10;
		
		lr = 1; // Left rotation
		
		for(amt = 0; amt < 15; amt = amt + 1)
			#10;
		
		#10;
		
		$stop;
	end
      
endmodule

