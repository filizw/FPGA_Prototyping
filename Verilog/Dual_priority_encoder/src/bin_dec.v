`timescale 1ns / 1ps

// 4-to-12 binary decoder
module bin_dec(
    input [3:0] a,
    output reg [11:0] y
    );

	always @*
	begin
		casez(a)
			4'd12: y = 12'b100000000000;
			4'd11: y = 12'b010000000000;
			4'd10: y = 12'b001000000000;
			4'd9: y = 12'b000100000000;
			4'd8: y = 12'b000010000000;
			4'd7: y = 12'b000001000000;
			4'd6: y = 12'b000000100000;
			4'd5: y = 12'b000000010000;
			4'd4: y = 12'b000000001000;
			4'd3: y = 12'b000000000100;
			4'd2: y = 12'b000000000010;
			4'd1: y = 12'b000000000001;
			default: y = 12'd0;
		endcase
	end

endmodule
