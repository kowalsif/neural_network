`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Joseph Doherty
// 
// Create Date: 03/28/2014 08:24:09 PM
// Module Name: Shifter
// Project Name: Nerual Network
// Description: Shifts base by power into result
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Shifter(base,power,clk,result);
input [31:0] base, power;
input clk;
output [31:0] result;
    
    always @ (posedge clk) begin
        result <= base << power;
    end

endmodule
