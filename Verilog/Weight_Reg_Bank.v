//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: WeightRegBank
// Project Name: Neural Network
// Description: For 4 units
// 
//////////////////////////////////////////////////////////////////////////////////

module WeightRegBank(dataIn, address, write, reset, clk, out0, out1, out2, out3);
input [7:0] dataIn;
input [1:0] address;
input write, reset, clk;
output reg [7:0] out0, out1, out2, out3;

always @ (posedge clk) begin
    if (reset == 1) begin
        out0 <= 0;
    	out1 <= 0;
    	out2 <= 0;
    	out3 <= 0;   
        end
	else if(write == 1) begin
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

