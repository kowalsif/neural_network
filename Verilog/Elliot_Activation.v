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
    output [31:0] y,
    output end_signal
    );
    
    reg [31:0] shifted_x;
    wire den_start;
    wire [31:0] den_out;
    
	parameter s = 8'b00000001;
    
	always @ (x) begin
		shifted_x <= x << s ;
	end
    Denominator denominator(x, clk, start, den_start, den_out);
    Divisor_non_restoring divisor(shifted_x, den_out, clk, den_start, y, end_signal);
    
endmodule
