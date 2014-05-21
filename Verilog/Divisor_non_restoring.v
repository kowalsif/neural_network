`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2014 07:36:10 PM
// Design Name: 
// Module Name: Divisor_non_restoring
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


module Divisor_non_restoring(
    input [31:0] Top,
    input [31:0] Divisor,
    input CLOCK,
    input START,
    input reset,
    output [31:0] Quotient,
    output fin
    );
   
wire [31:0] remainder;
//simple_divider div(Quotient[15:0],remainder,fin,Top,Divisor[15:0],START,CLOCK);
divide div(fin,Quotient,remainder, Top,Divisor,1'b1,CLOCK,START);

endmodule