`timescale 1ns / 1ps

// Integer-to-floating-point conversion circuit
module int_to_fp(
    input [7:0] integ,
    output sign,
    output reg [3:0] exp,
    output reg [7:0] frac
    );

	reg [2:0] lead0;

	always @*
	begin
		// Count leading 0s and assign appropriate exponent
		if(integ[6])
		begin
			exp = 4'd7;
			lead0 = 3'd1;
		end
		else if(integ[5])
		begin
			exp = 4'd6;
			lead0 = 3'd2;
		end
		else if(integ[4])
		begin
			exp = 4'd5;
			lead0 = 3'd3;
		end
		else if(integ[3])
		begin
			exp = 4'd4;
			lead0 = 3'd4;
		end
		else if(integ[2])
		begin
			exp = 4'd3;
			lead0 = 3'd5;
		end
		else if(integ[1])
		begin
			exp = 4'd2;
			lead0 = 3'd6;
		end
		else if(integ[0])
		begin
			exp = 4'd1;
			lead0 = 3'd7;
		end
		else
		begin
			exp = 4'd0;
			lead0 = 3'd0;
		end
		
		// Shift input integer according to leading 0
		frac = {1'b0, integ[6:0]} << lead0;
	end

	assign sign = integ[7];

endmodule
