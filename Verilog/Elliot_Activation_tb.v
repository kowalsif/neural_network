`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2014 06:30:04 PM
// Design Name: 
// Module Name: Elliot_Activation_tb2
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


module Elliot_Activation_tb2();

    reg [31:0] x;
    reg start;
    reg clk;
    wire [31:0] y;
    wire end_signal;
    
    Elliot_Activation elliot(x, start, clk, y, end_signal);
    
    initial begin
    x=0; start=0; clk=0; #5;
       
    x=2; start=1; #5;
    start = 0; #5;
       
    #1000;   
    $stop;
    end
    
    always #1 clk = ~clk;

endmodule
