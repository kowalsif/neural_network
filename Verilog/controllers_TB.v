`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:39:56 05/19/2014
// Design Name:   Network_Controller
// Module Name:   C:/Users/dohertjp/Documents/Courses/Neural Network on FPGA/RAM_driver_integration/controllers.v
// Project Name:  RAM_driver_integration
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Network_Controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module controllers;

	// Inputs
	reg network_start;
	reg done;
	reg reset;
	reg clk;

	// Outputs
	wire layer_sel;
	wire [1:0] layer;
	wire RAM_Controll_Start;
	wire [9:0] RAM_address;
	wire [1:0] unit_sel,unit_address; //TODO: Python
	wire write, sum_trigger;

	// Network_Controller(start,done,reset,clk,layer_sel,layer,RAM_Controll_Start);
	Network_Controller network (
		.start(network_start), 
		.done(done), 
		.reset(reset), 
		.clk(clk), 
		.layer_sel(layer_sel), 
		.layer(layer), 
		.RAM_Controll_Start(RAM_Controll_Start)
	);
	
	// RAM_Read_Driver(start,layer,reset,clk,RAM_address,unit_sel,unit_address,write,sum_trigger);
	RAM_Read_Driver ram_driver (
		.start(RAM_Controll_Start),
		.layer(layer),
		.reset(reset),
		.clk(clk),
		.RAM_address(RAM_address),
		.unit_sel(unit_sel),
		.unit_address(unit_address),
		.write(write),
		.sum_trigger(sum_trigger)
	);
	

	initial begin
		// Initialize Inputs
		network_start = 0; done = 0; reset = 1; clk = 0; #10;
		reset = 0; #10;
		network_start = 1; #2;
		network_start = 0;
	end
	
	always @ (posedge sum_trigger) begin
		#20; done = 1; #4; done = 0;
	end
	
	always @ (layer or done)
		if(layer == 2 && done == 1) begin
			#10; $stop;
		end
	
	always #1 clk = ~clk;
      
endmodule

