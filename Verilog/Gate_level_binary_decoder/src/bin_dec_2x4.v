`timescale 1ns / 1ps

// 2-to-4 binary decoder
module bin_dec_2x4(
    input en,
    input [1:0] a,
    output [3:0] bcode
    );

	assign bcode[0] = en & ~a[1] & ~a[0];
	assign bcode[1] = en & ~a[1] & a[0];
	assign bcode[2] = en & a[1] & ~a[0];
	assign bcode[3] = en & a[1] & a[0];

endmodule
