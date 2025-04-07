`timescale 1ns / 1ps

module bcd_inc12_tb;

	// Inputs
	reg [3:0] in0;
	reg [3:0] in1;
	reg [3:0] in2;

	// Outputs
	wire [3:0] out0;
	wire [3:0] out1;
	wire [3:0] out2;

	// Instantiate the Unit Under Test (UUT)
	bcd_inc12 uut (
		.in0(in0), 
		.in1(in1), 
		.in2(in2), 
		.out0(out0), 
		.out1(out1), 
		.out2(out2)
	);

	initial
	begin
		// Test the whole range of values (from 0 to 999)
		for(in2 = 0; in2 < 10; in2 = in2 + 1)
		begin
			for(in1 = 0; in1 < 10; in1 = in1 + 1)
			begin
				for(in0 = 0; in0 < 10; in0 = in0 + 1)
				begin
					#5;
					$display("%d%d%d -> %d%d%d", in2, in1, in0, out2, out1, out0);
				end
			end
		end
	end
      
endmodule

