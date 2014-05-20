`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2014 06:00:35 PM
// Design Name: 
// Module Name: ram_tb
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


module ram_tb();
reg [9:0] addra;
reg CLOCK;
reg write;
reg [31:0] data;
wire [31:0] out;
   
    
ram_access UUT(addra, CLOCK, write, data, out);
    
    initial begin 
    CLOCK = 0; write = 0; data = 0;
    #100;
    addra = 31'b0; #11;
    addra = 31'b1; #10;
    addra = 31'b101; #10
    
    $stop;
    end
    
    always #1 CLOCK = ~CLOCK;
    
endmodule
