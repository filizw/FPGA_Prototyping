`timescale 1ns / 1ps

// Floating-point-to-integer conversion circuit
module fp_to_int(
    input sign,
    input [3:0] exp,
    input [7:0] frac,
    output reg [7:0] integ,
    output uf,
    output of
    );

	reg [7:0] frac_shifted;

	always @*
	begin
		integ = 8'd0;
		
		if(frac[7])
		begin
			integ[7] = sign;
			{integ[6:0], frac_shifted} = frac << exp;
		end
	end

	// Set underflow flag
	assign uf = frac[7] && (exp == 4'd0);
	
	// Set overflow flag
	assign of = frac[7] && (exp > 4'd7);

endmodule
