`timescale 1ns / 1ps

// Dual-priority encoder testing circuit
module dual_prio_enc_test(
    input clk,
    input [11:0] req, // Active low input
    output [2:0] an,
    output [7:0] sseg
    );

	wire [3:0] hex0, hex1;
	wire [7:0] in0, in1, in2;

	// Invert request bits for active low input
	dual_prio_enc enc_unit(.req(~req), .first(hex1), .second(hex0));
	
	hex_to_sseg sseg_unit0(.hex(hex0), .dp(1'b1), .sseg(in0));
	hex_to_sseg sseg_unit1(.hex(hex1), .dp(1'b1), .sseg(in1));
	
	sseg_disp_mux disp_mux_unit(.clk(clk), .in0(in0), .in1(in1), .in2(in2), .an(an), .sseg(sseg));
	
	// Blank symbol
	assign in2 = 8'hff;
	
endmodule
