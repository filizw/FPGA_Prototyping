`timescale 1ns / 1ps

module bin_dec_2x4_tb;

	// Inputs
	reg en;
	reg [1:0] a;

	// Outputs
	wire [3:0] bcode;

	// Instantiate the Unit Under Test (UUT)
	bin_dec_2x4 uut (
		.en(en), 
		.a(a), 
		.bcode(bcode)
	);

	initial
	begin
		en = 0;
	
		for(a = 0; a < 3; a = a + 1)
			#10;
		
		#10;
		
		en = 1;
	
		for(a = 0; a < 3; a = a + 1)
			#10;
		
		#10;
		
		$stop;
	end
      
endmodule

