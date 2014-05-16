import unit_generation
import math

def NeuralUnit(numUnits):
	f= open('Neural_Unit.v', 'w')
	f.write(unit_generation.header('NeuralUnit', 'For '+str(numUnits)+' units'))
	
	f.write('module NeuralUnit(\n')
	for i in range(numUnits):
		f.write('\tinput [31:0] input'+str(i)+',\n')
	f.write('\tinput [7:0] weight,\n')
	addressSize = int(math.ceil(math.log(numUnits)/math.log(2)))-1
	f.write('\tinput [{}:0] address,\n'.format(addressSize))
	f.write('\tinput write,\n')
	f.write('\tinput sumTrigger,\n')
	f.write('\tinput layer_Sel,\n')
#	f.write('\tinput activate,\n')
	f.write('\tinput clk,\n')
	f.write('\toutput [31:0] layerOut,\n')
	f.write('\toutput layerDone\n')
	f.write('\t);\n\n')
	
	#create outputReg
	#f.write('\t//Reg\n')
	#f.write('\treg [31:0] outReg;\n\n')
	#create wires
	f.write('\t//Wires\n')
	for i in range(numUnits):
		f.write('\twire [7:0] weightWire'+str(i)+';\n')
	for i in range(numUnits):
		f.write('\twire [31:0] shiftWire'+str(i)+';\n')
	f.write('\twire [31:0] sumWire;\n')
	f.write('\twire [31:0] elliotWire;\n')
#	f.write('\twire [31:0] layerMuxOut;\n')
	f.write('\twire elliot_end_signal;\n')
	f.write('\twire sum_end_signal;\n')
	#f.write('\tparameter unactivated 32\'h00000000;\n')
	
	
	#create the weight reg block
	f.write('\t//Create weight reg block\n')
	f.write('\tWeightRegBank bank(weight, address, write, clk, ')
	for i in range(numUnits):
		f.write('weightWire'+str(i))
		if i != (numUnits-1):
			f.write(', ')
	f.write(');\n\n')
	
	#create Elliot Function
	f.write('\t//Create Elliot Function\n')
	f.write('\tElliot_Activation elliot(sumWire, sum_end_signal, clk, elliotWire, elliot_end_signal);\n\n')
	
	#create summer
	f.write('\t//Create summer\n')
	f.write('\tMultiSum summer(')
	for i in range(numUnits):
		f.write('shiftWire{},'.format(i))
	f.write('sumTrigger, clk, sumWire, sum_end_signal);\n\n')
	
	#create layer mux
	f.write('\t//Create layer mux\n')
	f.write('\tLayerMux layer(sumWire, elliotWire, sum_end_signal, elliot_end_signal, layer_Sel, layerOut, layerDone);\n\n')
	
	#create shifters
	f.write('\t//Create shifters\n')
	for i in range(numUnits):
		f.write('\tShifter shifter'+str(i)+'(input'+str(i)+', weightWire'+str(i)+', clk, shiftWire'+str(i)+');\n')
	
#	f.write('\n\tassign layerOut = outReg;\n')
	
#	f.write('\n\talways @ (activate or layerMuxOut) begin\n')
#	f.write('\t\tcase(activate)\n')
#	f.write('\t\t1\'b0: layerOut <= 0;\n')
#	f.write('\t\t1\'b1: layerOut <= layerMuxOut;\n')
#	f.write('\t\tdefault: layerOut <= 0;\n')
#	f.write('\t\tendcase\n')
#	f.write('\tend\n\n')

	f.write('endmodule')

def NeuralUnit_tb(numUnits):
	f = open('NeuralUnit_tb.v', 'w')
	f.write('`timescale 1ns / 1ps\n')
	f.write(unit_generation.header('NeuralUnit Test Fixture', ' '))
	
	f.write('module NeuralUnit_tb();\n')
	for i in range(numUnits):
		f.write('reg [31:0] input{};\n'.format(i))
	f.write('reg [7:0] weight;\n')
	addressSize = int(math.ceil(math.log(numUnits)/math.log(2)))-1
	f.write('reg [{}:0] address;\n'.format(addressSize))
	f.write('reg write;\n')
	f.write('reg sumTrigger;\n')
	f.write('reg layer_Sel;\n')
	f.write('reg clk;\n')
	
	f.write('wire [31:0] layerOut;\n')
	f.write('wire layerDone;\n')
	
	f.write('NeuralUnit UUT(')
	for i in range(numUnits):
		f.write('input{}, '.format(i))
	f.write('weight, address, write, sumTrigger, layer_Sel, clk, layerOut, layerDone);\n\n')
	
	for i in range(numUnits):
		f.write('\twire [7:0] internalWeight{0} = UUT.weightWire{0};\n'.format(i))
		f.write('\twire [31:0] shifter{0} = UUT.shiftwire{0};\n'.format(i))
		
	
	f.write("""
	wire [31:0] sum = UUT.sumWire;
	wire sumEnd = UUT.sum_end_signal;
	wire [31:0] elliot = UUT.elliotWire;
	wire elliotEnd = UUT.elliot_end_signal;
	reg [4:0] count=0;""")
	
	f.write('\ninitial begin\n')
	f.write('\tclk=0;\n\t')
	
	for i in range(numUnits):
		f.write('input{0}={0}; '.format(i))
	f.write('\n')
	
	for i in range(numUnits):
		f.write('\tweight={0}; address={0}; write=1; sumTrigger=0; layer_Sel=0; #5;\n'.format(i))
		f.write('\twrite=0; #5;\n')
	f.write('end\n\n')
	
	f.write('always @ (posedge layerDone) begin\n')
	f.write('\tcount = count+1;\n')
	f.write('\tif(count == 3) begin #5; $finish; end\n')
	f.write('\tif(count == 2) layer_sel=0;\n\t')
	for i in range(numUnits):
		f.write('input{0} = count+{0}; '.format(i))
	f.write('\n')
	
	for i in range(numUnits):
		f.write('\tweight= count*{0}+1; address={1}; write=1; #5;\n'.format(i+1, i))
		f.write('\twrite=0; #5;\n')
	f.write('\tsumTrigger=1; #5;\n')
	f.write('\tsumTrigger=0; #5;\n')
	f.write('end\n\n')
	
	f.write('always #1 clk= ~clk;\n\n')
	f.write('endmodule\n')