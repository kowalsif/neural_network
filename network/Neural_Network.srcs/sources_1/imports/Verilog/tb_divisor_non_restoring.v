`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2014 02:49:27 PM
// Design Name: 
// Module Name: tb_divisor_non_restoring
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


module tb_divisor_non_restoring;
    reg [31:0] Top;
    reg [31:0] Divisor;
    reg CLOCK;
    reg START;
    
    wire [31:0] Quotient;
    wire Finish;
    
    
    Divisor_non_restoring uut (
        .Top(Top),
        .Divisor(Divisor),
        .CLOCK(CLOCK),
        .START(START),
        .Quotient(Quotient),
        .Finish(Finish)
    );
    
    
    initial begin CLOCK = 0; forever #5 CLOCK = ~CLOCK; end
    initial begin
        #400;
        Top = 10;
        Divisor = 2;
        START = 1'b1;
        #10;
        START = 1'b0;
        #295;
        Top = 10;
        Divisor = 3;
        START = 1'b1;
        #10;
        START = 1'b0;
        #295;
        Top = -10;
        Divisor = 2;
        START = 1'b1;
        #10;
        START = 1'b0;
        #295;
        Top = 10;
        Divisor = -4;
        START = 1'b1;
        #10;
        START = 1'b0;
        #295;
     end
endmodule
