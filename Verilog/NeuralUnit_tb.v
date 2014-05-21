`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: NeuralUnit Test Fixture
// Project Name: Distributed Brain
// Description:  
// 
//////////////////////////////////////////////////////////////////////////////////

module NeuralUnit_tb();
reg [31:0] input0;
reg [31:0] input1;
reg [31:0] input2;
reg [31:0] input3;
reg [7:0] weight;
reg [1:0] address;
reg write;
reg sumTrigger;
reg layer_Sel;
reg reset;
reg clk;
wire [31:0] layerOut;
wire layerDone;

NeuralUnit UUT(
	.input0(input0),
	.input1(input1),
	.input2(input2),
	.input3(input3),
	.weight(weight),
	.address(address),
	.write(write),
	.sumTrigger(sumTrigger),
	.layer_Sel(layer_Sel),
	.reset(reset),
	.clk(clk),
	.layerOut(layerOut),
	.layerDone(layerDone)
	);


	wire [7:0] internalWeight0 = UUT.weightWire0;
	wire [31:0] shifter0 = UUT.shiftWire0;
	wire [7:0] internalWeight1 = UUT.weightWire1;
	wire [31:0] shifter1 = UUT.shiftWire1;
	wire [7:0] internalWeight2 = UUT.weightWire2;
	wire [31:0] shifter2 = UUT.shiftWire2;
	wire [7:0] internalWeight3 = UUT.weightWire3;
	wire [31:0] shifter3 = UUT.shiftWire3;

	wire [31:0] sum = UUT.sumWire;
	wire sumEnd = UUT.sum_end_signal;
	wire [31:0] elliot = UUT.elliotWire;
	wire elliotEnd = UUT.elliot_end_signal;
	reg [4:0] count=0;
	
initial begin
	clk=0; reset=1;
	input0=0; input1=1; input2=2; input3=3; #5;
	reset=0; #5;
	weight=0; address=0; write=1; sumTrigger=0; layer_Sel=1; #5;
	write=0; #5;
	weight=1; address=1; write=1; sumTrigger=0; layer_Sel=1; #5;
	write=0; #5;
	weight=2; address=2; write=1; sumTrigger=0; layer_Sel=1; #5;
	write=0; #5;
	weight=3; address=3; write=1; sumTrigger=0; layer_Sel=1; #5;
	write=0; #5;
	sumTrigger=1; #5;
	sumTrigger=0;
end

always @ (posedge layerDone) begin
	count = count+1;
	if(count == 3) begin #5; $finish; end
	if(count == 2) layer_Sel=0;
	input0 = count+0; input1 = count+1; input2 = count+2; input3 = count+3; 
	weight= count*1+1; address=0; write=1; #5;
	write=0; #5;
	weight= count*2+1; address=1; write=1; #5;
	write=0; #5;
	weight= count*3+1; address=2; write=1; #5;
	write=0; #5;
	weight= count*4+1; address=3; write=1; #5;
	write=0; #5;
	sumTrigger=1; #5;
	sumTrigger=0; #5;
end

always #1 clk= ~clk;

endmodule
