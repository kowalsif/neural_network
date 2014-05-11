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
module Network_Controller(start,done, RAM_done,reset,clk,layer_sel,sum_trigger,output_sel,activate,RAM_Controll_Start);
input start, done, RAM_done, reset, clk;
output reg [1:0] layer_sel;
output reg sum_trigger;
output reg [N:0] output_sel, activate;
output reg RAM_Controll_Start;

reg state, nextState;

always @ (posedge clk)
	if(reset==1) state <= 0;
	else state <= nextState;

always @ (state,start,RAM_done) begin
	case(state)
		0: begin
			layer_sel <= 0;
			sum_trigger <= 0;
			output_sel <= 0;
			activate <= 0;
			RAM_Controll_Start <= 0;
			if(start==1)
				nextState<=1;
			else
				nextState<=0;
			end
		1: begin
			layer_sel <= layer_sel;
			sum_trigger <= 0;
			output_sel <= 0;
			activate <= activate;
			RAM_Controll_Start <= 1;
			nextState<=2;
			end
		2: begin
			layer_sel <= layer_sel;
			sum_trigger <= 0;
			output_sel <= 0;
			activate <= activate;
			RAM_Controll_Start <= 0;
			if(RAM_done==1)
				nextState<=3;
			else
				nextState<=2;
			end
		3: begin
			layer_sel <= layer_sel;
			sum_trigger <= 1;
			output_sel <= 0;
			activate <= activate;
			RAM_Controll_Start <= 0;
			nextState <= 4;
			end
		4: begin
			layer_sel <= layer_sel;
			sum_trigger <= 0;
			output_sel <= 0;
			activate <= activate;
			if(done==1)
				nextState <= 5;
			else
				nextState <= 4;
			end
		5: begin
			if(layer_sel == 2) begin
				layer_sel <= 0;
				activate <= num_units; //This is the first hidden unit layer, we need to make the weights bury the input signals
			end else if(layer_sel == 1) begin
				layer_sel <= 2;
				activate <= num_output;
			end else begin
				layer_sel <= 1;
				activate <= num_units;
			end
			sum_trigger <= 0;
			output_sel <= 0;
			nextState <= 0;
			end
		default: begin
			layer_sel <= 0;
			sum_trigger <= 0;
			output_sel <= 0;
			activate <= 0;
			nextState <= 0;
			end
	endcase
end
endmodule
