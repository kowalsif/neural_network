`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:21:04 05/15/2014
// Design Name:   RAM_Read_Driver
// Module Name:   C:/Users/dohertjp/Documents/Courses/Neural Network on FPGA/controller/RAM_Read_Driver_TB.v
// Project Name:  controller
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RAM_Read_Driver
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RAM_Read_Driver_TB;

	// Inputs
	reg start;
	reg [1:0] layer;
	reg reset;
	reg clk;

	// Outputs
	wire [9:0] RAM_address;
	wire [1:0] unit_sel;
	wire [1:0] unit_address;
	wire write;
	wire sum_trigger;
	
	wire [2:0] state, nextstate;
	wire [2:0] count, unitcount;

	// Instantiate the Unit Under Test (UUT)
	RAM_Read_Driver uut (
		.start(start), 
		.layer(layer), 
		.reset(reset), 
		.clk(clk), 
		.RAM_address(RAM_address), 
		.unit_sel(unit_sel), 
		.unit_address(unit_address), 
		.write(write),
		.sum_trigger(sum_trigger)
	);
	
	assign state = uut.state;
	assign nextstate = uut.nextstate;
	assign count = uut.count;
	assign unitcount = uut.count;

	initial begin
		// Initialize Inputs
		start = 0; layer = 0; reset = 1; clk = 0; #10;
		reset = 0; #10;
		start = 1; #2;
		start = 0; 
	end
	
	always @ (sum_trigger)
		if(sum_trigger==1) 
			if(layer == 2) begin #10; $stop; end
			else begin #10; layer = layer + 1; #5; start = 1; #2; start = 0; end
	
	always #2 clk = ~clk;
      
endmodule

