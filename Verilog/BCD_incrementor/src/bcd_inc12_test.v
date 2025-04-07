`timescale 1ns / 1ps

// BCD incrementor testing circuit
module bcd_inc12_test(
    input clk,
    input [3:0] in0,
    input [3:0] in1,
    input [3:0] in2,
    output [2:0] an,
    output [7:0] sseg
    );

	wire [3:0] bcd0, bcd1, bcd2;
	wire [7:0] sseg0, sseg1, sseg2;
	
	// Active low input
	bcd_inc12 bcd_inc_unit(.in0(~in0), .in1(~in1), .in2(~in2), .out0(bcd0), .out1(bcd1), .out2(bcd2));

	hex_to_sseg sseg_unit0(.hex(bcd0), .dp(1'b1), .sseg(sseg0));
	hex_to_sseg sseg_unit1(.hex(bcd1), .dp(1'b1), .sseg(sseg1));
	hex_to_sseg sseg_unit2(.hex(bcd2), .dp(1'b1), .sseg(sseg2));
	
	sseg_disp_mux disp_mux_unit(.clk(clk), .in0(sseg0), .in1(sseg1), .in2(sseg2), .an(an), .sseg(sseg));

endmodule
