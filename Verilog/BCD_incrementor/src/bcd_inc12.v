`timescale 1ns / 1ps

// 12-bit BCD incrementor
module bcd_inc12(
    input [3:0] in0,
    input [3:0] in1,
    input [3:0] in2,
    output [3:0] out0,
    output [3:0] out1,
    output [3:0] out2
    );

	wire en0, en1, en2, cout0, cout1, cout2;

	// Instantiate single digit adder for every input
	bcd_add_1 add_unit0(.in(in0), .en(en0), .out(out0), .cout(cout0));
	bcd_add_1 add_unit1(.in(in1), .en(en1), .out(out1), .cout(cout1));
	bcd_add_1 add_unit2(.in(in2), .en(en2), .out(out2), .cout(cout2));
	
	assign en0 = 1'b1;
	assign en1 = cout0;
	assign en2 = cout1;

endmodule
