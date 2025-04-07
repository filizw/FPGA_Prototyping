`timescale 1ns / 1ps

// Seven-segment display time-multiplexing circuits
module sseg_disp_mux(
    input clk,
    input [7:0] in0,
    input [7:0] in1,
    input [7:0] in2,
    output reg [2:0] an,
    output reg [7:0] sseg
    );

	// Refreshing rate around 763 Hz (100 MHz/2^17)
	localparam N = 19;
	
	reg [N-1:0] cnt = {N{1'b0}};
	
	always @(posedge clk)
	begin
		if(cnt[N-1:N-2] == 2'b11) // Reset counter
			cnt <= {{(N-1){1'b0}}, 1'b1};
		else
			cnt <= cnt + 1;
	end
	
	// 2 MSBs of counter control multiplexing
	always @*
	begin
		case(cnt[N-1:N-2])
			2'b10:
			begin
				sseg = in2;
				an = 3'b011;
			end
			2'b01:
			begin
				sseg = in1;
				an = 3'b101;
			end
			default:
			begin
				sseg = in0;
				an = 3'b110;
			end
		endcase
	end

endmodule
