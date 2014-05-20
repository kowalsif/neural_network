`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: MultiSum
// Project Name: FPGA Brain
// Description:  
// 
//////////////////////////////////////////////////////////////////////////////////

module MultiSum(in0, in1, in2, in3, start, clk, sum, done);
input [31:0] in0, in1, in2, in3;
input start, clk;
output reg [31:0] sum;
output reg done;

reg [2:0] state;

always @ (posedge clk) begin
	case(state)
		0: begin
			sum <= in0;
			state <= state + 1'b1;
			done <= 0;
		end
		1: begin
			sum <= sum + in1;
			state <= state + 1'b1;
			done <= 0;
		end
		2: begin
			sum <= sum + in2;
			state <= state + 1'b1;
			done <= 0;
		end
		3: begin
			sum <= sum + in3;
			state <= state + 1'b1;
			done <= 1;
		end
		default: begin
			sum <= sum;
			if(start == 1)
				state <= 0;
			else state <= state;
			done <= 0;
		end
	endcase
end
endmodule
