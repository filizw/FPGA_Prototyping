`timescale 1ns / 1ps

// 4-to-16 binary decoder
module bin_dec_4x16(
    input en,
    input [3:0] a,
    output [15:0] bcode
    );

	wire en0, en1, en2, en3;
	
	bin_dec_2x4 dec_unit0(.en(en0), .a(a[1:0]), .bcode(bcode[3:0]));
	bin_dec_2x4 dec_unit1(.en(en1), .a(a[1:0]), .bcode(bcode[7:4]));
	bin_dec_2x4 dec_unit2(.en(en2), .a(a[1:0]), .bcode(bcode[11:8]));
	bin_dec_2x4 dec_unit3(.en(en3), .a(a[1:0]), .bcode(bcode[15:12]));
	
	
	assign en0 = en & ~a[3] & ~a[2];
	assign en1 = en & ~a[3] & a[2];
	assign en2 = en & a[3] & ~a[2];
	assign en3 = en & a[3] & a[2];

endmodule
