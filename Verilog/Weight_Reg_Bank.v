//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: WeightRegBank
// Project Name: Distributed Brain
// Description: For 4 units
// 
//////////////////////////////////////////////////////////////////////////////////

module WeightRegBank(dataIn, address, write, clk, out0, out1, out2, out3);
input [7:0] dataIn;
input [1:0] address;
input write, clk;
output reg [7:0] out0, out1, out2, out3;

always @ (posedge clk) begin
	if(write == 1) begin
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
	end
end
endmodule
