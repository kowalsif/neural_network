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
wire [1:0] address;
wire writeData;
wire start_network_controller;

ROM_Controller UUT(
    start,
    clk,
    reset,
    rom_output,
	address,
	writeData,
    start_network_controller
    );
    
initial begin
start=0; clk=0; reset =1; #5;
reset=0; start=1; #10;

end

always @(posedge UUT.debounce.Timeout)begin
    #100;
    $stop;
end

always #1 clk = ~clk;

endmodule
