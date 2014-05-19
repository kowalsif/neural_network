`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:35:06 05/10/2014 
// Design Name: 
// Module Name:    Network_Controller 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Network_Controller(start,done,reset,clk,layer_sel,layer,RAM_Controll_Start);
input start, done, reset, clk;
output reg layer_sel;
output reg [1:0] layer;

//output reg [N:0] output_sel;
output reg RAM_Controll_Start;

reg [1:0] state, nextState;

always @ (posedge clk)
	if(reset==1) state <= 0;
	else state <= nextState;

always @ (layer)
	if(layer == 2)
		layer_sel <=0;
	else
		layer_sel <=1;

always @ (state,start,done) begin
	case(state)
		0: begin
			if(start==1)
				nextState<=1;
			else
				nextState<=0;
			end
		1: begin
			nextState<=2;
			end
		2: begin
			if(done==1)
				nextState <= 3;
			else
				nextState <= 2;
			end
		3: begin
			if(layer == 2)
				nextState <= 0;
			else
				nextState <= 1;
			end
		default: begin
			nextState <= 0;
			end
	endcase
end

always @ (posedge clk) begin
	if(reset == 1) begin
		layer <= 0;
//		output_sel <= 0;
		RAM_Controll_Start <= 0;
		end
	else case(state)
		0: begin
			layer <= 0;
//			output_sel <= 0;
			RAM_Controll_Start <= 0;
			end
		1: begin
			layer <= layer;
//			output_sel <= 0;
			RAM_Controll_Start <= 1;
			end
		2: begin
			layer <= layer;
//			output_sel <= 0;
			RAM_Controll_Start <= 0;
			end
		3: begin
			if(layer == 2)
				layer <= 0;
			else
				layer <= layer + 1;
//			output_sel <= 0;
			RAM_Controll_Start <= 0;
			end
		default: begin
			layer <= 0;
//			output_sel <= 0;
			RAM_Controll_Start <= 0;
			end
	endcase
end

endmodule
