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
reg [31:0] base;
reg [7:0] power;
reg clk;
wire [31:0] result;

//module Shifter(base,power,clk,result);
Shifter UUT (base,power,clk,result);

initial begin
	clk = 0; base = 0; power = 0; #5;
	base = 32'd32768; power = 8'd4; #10;
	base = 32'd32768; power = 8'd3; #10;
	base = 32'd32768; power = 8'd2; #10;
	base = 32'd32768; power = 8'd1; #10;
	base = 32'd32768; power = -8'd1; #10;
	base = 32'd32768; power = -8'd2; #10;
	base = 32'd32768; power = -8'd3; #10;
	base = 32'd32768; power = -8'd4; #10;
	$stop;
end

always #1 clk = ~clk;

endmodule
