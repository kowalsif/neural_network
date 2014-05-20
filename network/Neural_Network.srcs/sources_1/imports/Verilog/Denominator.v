`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2014 05:34:02 PM
// Design Name: 
// Module Name: Denominator
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


module Denominator(
    input [31:0] X,
    input CLOCK,
    input Startin,
    output reg Startout,
    output reg [31:0] denom
    );
    
always@(posedge CLOCK)
    begin
    if (X[31] == 1)
        denom <= (~X)+2'b10;
    else 
        denom <= X + 1'b1;
    end
    
always@(negedge CLOCK)
    Startout <= Startin;
    
endmodule
