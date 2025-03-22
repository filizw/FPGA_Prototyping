`timescale 1ns / 1ps

module bin_dec_3x8_tb;

	// Inputs
	reg en;
	reg [2:0] a;

	// Outputs
	wire [7:0] bcode;

	// Instantiate the Unit Under Test (UUT)
	bin_dec_3x8 uut (
		.en(en), 
		.a(a), 
		.bcode(bcode)
	);

	initial
	begin
		en = 0;
	
		for(a = 0; a < 7; a = a + 1)
			#10;
		
		#10;
		
		en = 1;
	
		for(a = 0; a < 7; a = a + 1)
			#10;
		
		#10;
		
		$stop;
	end
      
endmodule

