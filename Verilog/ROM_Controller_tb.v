`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2014 06:37:44 PM
// Design Name: 
// Module Name: ROM_Controller_tb
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


module ROM_Controller_tb( );
reg start;
reg clk;
reg reset;

wire [0:31] rom_output;
wire start_network_controller;

ROM_Controller UUT(
    start,
    clk,
    reset,
    rom_output,
    start_network_controller
    );
    
initial begin
start=0; clk=0; reset =1; #5;
reset=0; start=0; #10;
reset=0; start=1; #10;
reset=0; start=0; #5;

$stop;
end

always #1 clk = ~clk;

endmodule
