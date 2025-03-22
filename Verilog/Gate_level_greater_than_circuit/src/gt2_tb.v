`timescale 1ns / 1ps

module gt2_tb;

	// Inputs
	reg [1:0] a;
	reg [1:0] b;

	// Output
	wire agtb;

	// Instantiate the Unit Under Test (UUT)
	gt2 uut (
		.a(a), 
		.b(b), 
		.agtb(agtb)
	);

	reg [2:0] cnt_a, cnt_b;

	initial
	begin
		for(cnt_a = 0; cnt_a < 4; cnt_a = cnt_a + 1)
		begin
			for(cnt_b = 0; cnt_b < 4; cnt_b = cnt_b + 1)
			begin
				a = cnt_a;
				b = cnt_b;
				#10;
			end
		end
		
		$stop;
	end
      
endmodule

