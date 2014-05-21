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


module Elliot_Activation_tb();

    reg [31:0] x;
    reg start;
    reg clk;
	 reg reset;
    wire [31:0] y;
    wire end_signal;
	 
	 reg [2:0] count;
    
    Elliot_Activation UUT(.x(x), .start(start), .clk(clk), .reset(reset), .y(y), .end_signal(end_signal));
    
    initial begin
    x=0; start=0; clk=0; reset = 1; count = 0;#5;
	 reset = 0; #20;
	 start = 1; #5;
	 start = 0;
    end
    
	 always @(posedge end_signal)begin
		if(reset == 0) begin
			if(count == 4) begin #5; $stop; end
			else begin #10; count = count + 1; #20; start = 1; #5; start = 0; end
		end
	 end
	 
	 always @ (count) begin
		case(count)
			0: x=0;
			1: x=2;
			2: x=4;
			3: x=-1;
			default: x=0;
		endcase
	end
	 
    always #1 clk = ~clk;

endmodule
