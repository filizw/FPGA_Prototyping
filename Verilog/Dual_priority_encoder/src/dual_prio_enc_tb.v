`timescale 1ns / 1ps

module dual_prio_enc_tb;

	// Inputs
	reg [11:0] req;

	// Outputs
	wire [3:0] first;
	wire [3:0] second;

	// Instantiate the Unit Under Test (UUT)
	dual_prio_enc uut (
		.req(req), 
		.first(first), 
		.second(second)
	);

	initial
	begin
		for(req = 0; req < 4095; req = req + 1)
			#10;
		
		#10;
		
		$stop;
	end
      
endmodule

