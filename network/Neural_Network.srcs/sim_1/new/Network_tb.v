`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2014 05:59:35 PM
// Design Name: 
// Module Name: Network_tb
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


module Network_tb();
reg start, reset,sysclk;
wire done;

reg count[2:0];

Network UUT(start,reset,sysclk,done);

initial begin
//    #50; 
    start = 1'b0; reset <= 1'b1; sysclk = 1'b1; #30;
    reset <= 1'b0; #10;
    start = 1'b1; #400;
end
    
 always #1 sysclk = ~sysclk;
endmodule
