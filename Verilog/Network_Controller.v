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

always @ (posedge clk) begin //state
    if(state == 0) begin 
        layer <= 0;
    end else if(state == 3) begin
        if(layer == 3) begin
            layer <= 0;
        end
        else begin
            layer <= layer+1;
        end
    end else begin
        layer<= layer;
    end
end
	
always @ (state or start or done or layer) begin
	case(state)
		0: begin
			RAM_Controll_Start <= 0;
			if(start==1)
				nextState<=1;
			else
				nextState<=0;
			end
		1: begin
			RAM_Controll_Start <= 1;
			nextState<=2;
			end
		2: begin
			RAM_Controll_Start <= 0;
			if(done==1)
				nextState <= 3;
			else
				nextState <= 2;
			end
		3: begin
			if(layer == 3)begin
				nextState <= 0;
			end
			else begin
				nextState <= 1;
			end
			RAM_Controll_Start <= 0;
			end
		default: begin
			RAM_Controll_Start <= 0;
			nextState <= 0;
			end
	endcase
end
endmodule
