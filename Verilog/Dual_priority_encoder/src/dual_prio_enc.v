`timescale 1ns / 1ps

// Dual-priority encoder, it returns highest and second highest priority requests
module dual_prio_enc(
    input [11:0] req,
    output [3:0] first,
    output [3:0] second
    );

	wire [3:0] out0;
	wire [11:0] in1, dec_out;

	prio_enc enc_unit0(.r(req), .y(out0));
	prio_enc enc_unit1(.r(in1), .y(second));
	
	// Decode first priority request
	bin_dec dec_unit(.a(out0), .y(dec_out));
	
	assign first = out0;
	
	// Get rid of first priority request
	assign in1 = req & ~dec_out;
	
endmodule
