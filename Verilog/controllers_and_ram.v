`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:10:47 05/19/2014
// Design Name:   Network_Controller
// Module Name:   C:/Users/dohertjp/Documents/Courses/Neural Network on FPGA/RAM_driver_integration/controllers_and_mux.v
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

module controllers_and_ram_TB;

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
	wire [7:0] ram_out;
	wire [1:0] unit_sel,unit_address; //TODO: Python
	wire write, sum_trigger;
	wire [7:0] weight0;
	wire write0;
	wire [7:0] weight1;
	wire write1;
	wire [7:0] weight2;
	wire write2;
	wire [7:0] weight3;
	wire write3;

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
	
	// RAMMux(ram_out, unit_sel, write, CLOCK, weight0, write0, weight1, write1, weight2, write2, weight3, write3);
	RAMMux mux (
		.ram_out(ram_out),
		.unit_sel(unit_sel),
		.write(write),
		.CLOCK(clk),
		.weight0(weight0),
		.write0(write0),
		.weight1(weight1),
		.write1(write1),
		.weight2(weight2),
		.write2(write2),
		.weight3(weight3),
		.write3(write3)
	);
	
	// RAM STUFF
	blk_mem_gen_0 ram (
      .clka(clk),    // input wire clka
      .ena(1),      // input wire ena
      .wea(0),      // input wire [0 : 0] wea
      .addra(RAM_address),  // input wire [9 : 0] addra
      .dina(7'b0),    // input wire [7 : 0] dina
      .douta(ram_out)  // output wire [7 : 0] douta
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
