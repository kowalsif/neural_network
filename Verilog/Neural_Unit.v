`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: NeuralUnit
// Project Name: FPGA Brain
// Description: For 4 units
// 
//////////////////////////////////////////////////////////////////////////////////

module NeuralUnit(
	input [31:0] input0,
	input [31:0] input1,
	input [31:0] input2,
	input [31:0] input3,
	input [7:0] weight,
	input [1:0] address,
	input write,
	input sumTrigger,
	input layer_Sel,
	input reset,
	input clk,
	output [31:0] layerOut,
	output layerDone
	);

	//Wires
	wire [7:0] weightWire0;
	wire [7:0] weightWire1;
	wire [7:0] weightWire2;
	wire [7:0] weightWire3;
	wire [31:0] shiftWire0;
	wire [31:0] shiftWire1;
	wire [31:0] shiftWire2;
	wire [31:0] shiftWire3;
	wire [31:0] sumWire;
	wire [31:0] elliotWire;
	wire elliot_end_signal;
	wire sum_end_signal;
	wire elliot_start_signal;
	
	assign elliot_start_signal = sum_end_signal & layer_Sel;
	//Create weight reg block
	//module WeightRegBank(dataIn, address, write, reset, clk, out0, out1, out2, out3);
	WeightRegBank bank(.dataIn(weight), .address(address), .write(write), .reset(reset), .clk(clk), .out0(weightWire0), .out1(weightWire1), .out2(weightWire2), .out3(weightWire3));

	//Create Elliot Function
	//module Elliot_Activation(x,start,clk,reset,y,end_signal);
	Elliot_Activation elliot(.x(sumWire), .start(elliot_start_signal), .clk(clk), .reset(reset), .y(elliotWire), .end_signal(elliot_end_signal));

	//Create summer
	//module MultiSum(in0, in1, in2, in3, start, clk, reset, sum, done);
	MultiSum summer(.in0(shiftWire0),.in1(shiftWire1),.in2(shiftWire2),.in3(shiftWire3),.start(sumTrigger), .clk(clk), .reset(reset), .sum(sumWire), .done(sum_end_signal));

	//Create layer mux
	//module LayerMux(summed_input,elliot_input,summed_finished,elliot_finished,sel,y,done);
	LayerMux layer(.summed_input(sumWire), .elliot_input(elliotWire), .summed_finished(sum_end_signal), .elliot_finished(elliot_end_signal), .sel(layer_Sel), .y(layerOut), .done(layerDone));

	//Create shifters
	//module Shifter(base,power,clk,result);
	Shifter shifter0(.base(input0), .power(weightWire0), .clk(clk), .result(shiftWire0));
	Shifter shifter1(.base(input1), .power(weightWire1), .clk(clk), .result(shiftWire1));
	Shifter shifter2(.base(input2), .power(weightWire2), .clk(clk), .result(shiftWire2));
	Shifter shifter3(.base(input3), .power(weightWire3), .clk(clk), .result(shiftWire3));
endmodule