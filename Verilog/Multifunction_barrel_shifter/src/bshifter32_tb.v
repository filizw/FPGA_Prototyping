`timescale 1ns / 1ps

module bshifter32_tb;

	// Inputs
	reg [31:0] a;
	reg [4:0] amt;
	reg lr;

	// Outputs
	wire [31:0] y;

	// Instantiate the Unit Under Test (UUT)
	/*bshifter32 uut (
		.a(a), 
		.amt(amt), 
		.lr(lr), 
		.y(y)
	);*/
	
	bshifter32_r uut (
		.a(a), 
		.amt(amt), 
		.lr(lr), 
		.y(y)
	);

	initial
	begin
		a = 32'h60000000;
		
		lr = 0; // Right rotation
		
		for(amt = 0; amt < 31; amt = amt + 1)
			#10;
		
		#10;
		
		lr = 1; // Left rotation
		
		for(amt = 0; amt < 31; amt = amt + 1)
			#10;
		
		#10;
		
		$stop;
	end
      
endmodule

