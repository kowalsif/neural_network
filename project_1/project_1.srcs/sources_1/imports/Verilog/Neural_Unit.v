//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: NeuralUnit
// Project Name: Distributed Brain
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
	//Create weight reg block
	WeightRegBank bank(weight, address, write, clk, weightWire0, weightWire1, weightWire2, weightWire3);

	//Create Elliot Function
	Elliot_Activation elliot(sumWire, sum_end_signal, clk, elliotWire, elliot_end_signal);

	//Create summer
	MultiSum summer(shiftWire0,shiftWire1,shiftWire2,shiftWire3,sumTrigger, clk, sumWire, sum_end_signal);

	//Create layer mux
	LayerMux layer(sumWire, elliotWire, sum_end_signal, elliot_end_signal, layer_Sel, layerOut, layerDone);

	//Create shifters
	Shifter shifter0(input0, weightWire0, clk, shiftWire0);
	Shifter shifter1(input1, weightWire1, clk, shiftWire1);
	Shifter shifter2(input2, weightWire2, clk, shiftWire2);
	Shifter shifter3(input3, weightWire3, clk, shiftWire3);
endmodule