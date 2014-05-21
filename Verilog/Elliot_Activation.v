`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Robert Fendricks
// 
// Create Date: 04/30/2014 05:45:35 PM
// Design Name: 
// Module Name: Elliot_Activation
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Elliot_Activation(
    input [31:0] x,
    input start,
    input clk,
	 input reset,
    output [31:0] y,
    output end_signal
    );
	 
    reg [31:0] shifted_x;
    wire div_start;
    wire [31:0] den_out;
	 wire div_end, div_end_one_shot;
	 
	reg active;
	always @ (reset or start) begin
		if(reset==1) active <= 0;
		if(start==1) active <= 1;
	end
	 
	 assign end_signal = active && div_end_one_shot;
    
	parameter s = 8'h05;
    
	always @ (x) begin
		shifted_x <= x << s ;
	end

    Denominator denominator(.X(x), .CLOCK(clk), .start(start), .reset(reset), .startout(div_start), .denom(den_out));
    divide divider(.ready(div_end), .quotient(y), .remainder(), .dividend(shifted_x), .divider(den_out), .sign(1'b1), .clk(clk), .start(div_start));
	 ClockedOneShot div_shot(.InputPulse(div_end), .OneShot(div_end_one_shot), .Reset(reset), .CLOCK(clk));
    
endmodule
