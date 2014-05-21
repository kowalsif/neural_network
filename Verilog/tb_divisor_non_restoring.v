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
    reg [31:0] dividend;
    reg [31:0] divisor;
	 reg sign;
    reg CLOCK;
    reg START;
    
    wire [31:0] Quotient;
	 wire [31:0] remainder;
    wire Finish;
	 
	 reg [2:0] count;
    
    //module divide(ready,quotient,remainder,dividend,divider,sign,clk,start);
	 divide uut(
		.ready(Finish),
		.quotient(Quotient),
		.remainder(remainder),
		.dividend(dividend),
		.divider(divisor),
		.sign(sign),
		.clk(CLOCK),
		.start(START)
	);
    
	initial begin
		CLOCK = 0; START = 0; sign = 1; count = 0; #20;
	end
	
	always @ (posedge Finish) begin
		if(count == 4) begin #5; $stop; end
		begin count = count + 1; #5; START = 1; #5; START = 0; end
	end
	
	always @ (count) begin
		case(count)
			0: begin
				dividend = 10;
				divisor = 2;
				end
			1: begin
				dividend = 10;
				divisor = 3;
				end
			2: begin
				dividend = -10;
				divisor = 2;
				end
			3: begin
				dividend = 10;
				divisor = -4;
				end
			default: begin
				dividend = 0;
				divisor = 2;
				end
		endcase
	end
	  
	always #1 begin
		CLOCK = ~CLOCK;
	end
endmodule
