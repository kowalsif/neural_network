//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: WeightRegBank
// Project Name: Brain Network
// Description:  
// 
//////////////////////////////////////////////////////////////////////////////////

module WeightRegBank(dataIn, address, write, clk, out0, out1, out2, out3, out4, out5, out6, out7, out8, out9);
input [7:0] dataIn;
input [3:0] address;
input write, clk;
output reg [7:0] out0, out1, out2, out3, out4, out5, out6, out7, out8, out9;

always @ (posedge clk) begin
	if(write == 1) begin
		case(address)
			0: begin
				out0 <= dataIn;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				end
			1: begin
				out0 <= out0;
				out1 <= dataIn;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				end
			2: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= dataIn;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				end
			3: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= dataIn;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				end
			4: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= dataIn;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				end
			5: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= dataIn;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				end
			6: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= dataIn;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				end
			7: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= dataIn;
				out8 <= out8;
				out9 <= out9;
				end
			8: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= dataIn;
				out9 <= out9;
				end
			9: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= dataIn;
				end
			default: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				end
		endcase
	end
end
endmodule
