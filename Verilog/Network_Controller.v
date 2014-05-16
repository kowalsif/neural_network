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
module Network_Controller(start,done,reset,clk,layer_sel,layer,sum_trigger,RAM_Controll_Start);
input start, done, reset, clk;
output reg layer_sel;
output reg [1:0] layer;
output reg sum_trigger;
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
	
always @ (state,start,RAM_done) begin
	case(state)
		0: begin
			layer <= 0;
			sum_trigger <= 0;
//			output_sel <= 0;
			RAM_Controll_Start <= 0;
			if(start==1)
				nextState<=1;
			else
				nextState<=0;
			end
		1: begin
			layer <= layer;
			sum_trigger <= 0;
//			output_sel <= 0;
			RAM_Controll_Start <= 1;
			nextState<=2;
			end
		2: begin
			layer <= layer;
			sum_trigger <= 0;
//			output_sel <= 0;
			if(done==1)
				nextState <= 3;
			else
				nextState <= 2;
			end
		3: begin
			if(layer == 2)begin
				layer <= 0;
				nextState <= 0;
			end
			else begin
				layer <= layer + 1;
				nextState <= 1;
			end
			sum_trigger <= 0;
//			output_sel <= 0;
			end
		default: begin
			layer <= 0;
			sum_trigger <= 0;
//			output_sel <= 0;
			nextState <= 0;
			end
	endcase
end
endmodule
