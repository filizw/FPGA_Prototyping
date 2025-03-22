`timescale 1ns / 1ps

// 3-to-8 binary decoder
module bin_dec_3x8(
    input en,
    input [2:0] a,
    output [7:0] bcode
    );

	wire en0, en1;
	
	bin_dec_2x4 dec_unit0(.en(en0), .a(a[1:0]), .bcode(bcode[3:0]));
	bin_dec_2x4 dec_unit1(.en(en1), .a(a[1:0]), .bcode(bcode[7:4]));
	
	assign en0 = en & ~a[2];
	assign en1 = en & a[2];

endmodule
