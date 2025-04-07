`timescale 1ns / 1ps

// Add 1 to input value
module bcd_add_1(
    input [3:0] in,
	 input en,
    output reg [3:0] out,
	 output cout
    );

	always @*
	begin
		if(en)
		begin
			if(in < 4'd9)
				out = in + 1;
			else
				out = 0;
		end
		else
			out = in;
	end

	assign cout = en && (in == 4'd9);
	
endmodule
