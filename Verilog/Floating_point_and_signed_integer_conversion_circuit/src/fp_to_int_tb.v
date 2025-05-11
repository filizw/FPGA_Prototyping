`timescale 1ns / 1ps

module fp_to_int_tb;

	// Inputs
	reg sign;
	reg [3:0] exp;
	reg [7:0] frac;

	// Outputs
	wire [7:0] integ;
	wire uf;
	wire of;

	// Instantiate the Unit Under Test (UUT)
	fp_to_int uut (
		.sign(sign), 
		.exp(exp), 
		.frac(frac), 
		.integ(integ), 
		.uf(uf), 
		.of(of)
	);

	initial
	begin
		{sign, exp, frac} = 13'd0;
	
		#10 $display("NORMAL TEST");
		for(exp = 4'd1; exp < 4'd8; exp = exp + 1)
		begin
			#5 {sign, frac} = {1'b0, 8'hff};
			#5 {sign, frac} = {1'b1, 8'hff};
		end
		$stop;
		
		$display("UNDERFLOW TEST");
		exp = 4'd0;
		
		#5 {sign, frac} = {1'b0, 8'h00};
		#5 {sign, frac} = {1'b1, 8'h00};
		#5 {sign, frac} = {1'b0, 8'hff};
		#5 {sign, frac} = {1'b1, 8'hff};
		$stop;
		
		$display("OVERFLOW TEST");
		for(exp = 4'd15; exp > 4'd7; exp = exp - 1)
		begin
			#5 {sign, frac} = {1'b0, 8'hff};
			#5 {sign, frac} = {1'b1, 8'hff};
			#5 {sign, frac} = {1'b0, 8'h00};
		end
		
		$finish;
	end
		
	initial
	begin
		$monitor("|%b|%b|%b| -> %b  uf=%b of=%b", sign, exp, frac, integ, uf, of);
	end
		
endmodule
