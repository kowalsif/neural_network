`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2014 12:00:55 PM
// Design Name: 
// Module Name: Shifter_TB
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


module Shifter_TB();
reg [31:0] base, power;
reg clk;
wire [31:0] result;

Shifter UUT (base,power,clk,result);

initial begin
	clk = 0; base = 0; power = 0; #5;
	base = 31'd2; power = 31'd2; #10;
	base = 31'd10; power = 31'd1; #10;
	$stop;
end

always #1 begin
    clk = ~clk;
    end

endmodule
