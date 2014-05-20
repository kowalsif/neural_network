`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: DataRegBank
// Project Name: Distributed Brain
// Description: For 4 units
// 
//////////////////////////////////////////////////////////////////////////////////

module DataRegBank(in0, in1, in2, in3, dataIn, address, writeAddress, writeAll, clk, out0, out1, out2, out3);
input [31:0] in0, in1, in2, in3, dataIn;
input [1:0] address;
input writeAddress, writeAll, clk;
output reg [31:0] out0, out1, out2, out3;

always @ (posedge clk) begin
	if(writeAddress == 1) begin
		case(address)
			0: begin
				out0 <= dataIn;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				end
			1: begin
				out0 <= out0;
				out1 <= dataIn;
				out2 <= out2;
				out3 <= out3;
				end
			2: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= dataIn;
				out3 <= out3;
				end
			3: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= dataIn;
				end
			default: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				end
		endcase
	end else if (writeAll == 1) begin
		out0 <= in0;
		out1 <= in1;
		out2 <= in2;
		out3 <= in3;
	end
	else begin
	   out0 <= out0;
	   out1 <= out1;
	   out2 <= out2;
	   out3 <= out3;
	end
end
endmodule
