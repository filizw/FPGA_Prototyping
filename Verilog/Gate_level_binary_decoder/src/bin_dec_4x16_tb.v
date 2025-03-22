`timescale 1ns / 1ps

module bin_dec_4x16_tb;

	// Inputs
	reg en;
	reg [3:0] a;

	// Outputs
	wire [15:0] bcode;

	// Instantiate the Unit Under Test (UUT)
	bin_dec_4x16 uut (
		.en(en), 
		.a(a), 
		.bcode(bcode)
	);

	initial
	begin
		en = 0;
	
		for(a = 0; a < 15; a = a + 1)
			#10;
		
		#10;
		
		en = 1;
	
		for(a = 0; a < 15; a = a + 1)
			#10;
		
		#10;
		
		$stop;
	end
      
endmodule

