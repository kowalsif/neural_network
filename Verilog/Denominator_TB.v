`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:13:41 05/21/2014
// Design Name:   Denominator
// Module Name:   C:/Users/dohertjp/Documents/Courses/Neural Network on FPGA/unit_integration/Denominator_TB.v
// Project Name:  unit_integration
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Denominator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Denominator_TB;

	// Inputs
	reg [31:0] X;
	reg CLOCK;
	reg start;
	reg reset;

	// Outputs
	wire startout;
	wire [31:0] denom;
	
	reg [2:0] count;

	// Instantiate the Unit Under Test (UUT)
	Denominator uut (
		.X(X), 
		.CLOCK(CLOCK), 
		.start(start), 
		.reset(reset), 
		.startout(startout), 
		.denom(denom)
	);

	initial begin
		X = 0; CLOCK = 0; start = 0; count = 0; reset = 1; #5;
		reset = 0; #5;
		start = 1; #2;
		start = 0;
	end
	
	always @ (posedge startout) begin
		if(count == 4) begin #5; $stop; end
		else begin count = count + 1; #5; start=1; #2; start = 0; end
	end
	
	always @ (count) begin
		case(count)
			0: X = 0;
			1: X = 10;
			2: X = -10;
			3: X = -5;
			default: X = 0;
		endcase
	end
	
	always #1 CLOCK = ~CLOCK;
      
endmodule

