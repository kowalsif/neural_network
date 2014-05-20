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
input [31:0] base;
input [7:0] power;
input clk;
output reg [31:0] result;

reg [31:0] internalBase;

always @ (base)begin
    internalBase <=base;
end

always @ (posedge clk) begin
    if(power[7] == 1) begin
	   $display("%d", -power);
		//result <= base >> ~power + 1'b1;
		result <= internalBase >> -power;
	end else begin
		result <= internalBase << power;
	end
end

endmodule
