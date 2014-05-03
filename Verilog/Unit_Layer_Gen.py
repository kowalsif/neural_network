from unit_generation import *

def UnitLayer(numUnits):
	f= open('Unit_Layer.v', 'w')
	f.write(header('Unitlayer', ' '))
	
	f.write('module UnitLayer(\n')
	for i in range(numUnits):
		f.write('\tinput [31:0] input'+str(i)+',\n')
	f.write('\tinput [7:0] weight,\n')
	f.write('\tinput [3:0] address,\n')
	f.write('\tinput write,\n')
	f.write('\tinput sumTrigger,\n')
	f.write('\tinput elliotTrigger,\n')
	f.write('\tinput clk,\n')
	f.write('\toutput [31:0] layerOut\n')
	f.write('\t);\n\n')
	
	#create wires
	f.write('\t//Wires\n')
	for i in range(numUnits):
		f.write('\twire [7:0] weightWire'+str(i)+';\n')
	for i in range(numUnits):
		f.write('\twire [31:0] shiftWire'+str(i)+';\n')
	f.write('\twire [31:0] sumWire;\n')
	f.write('\twire [31:0] elliotWire;\n')
	f.write('\twire elliot_end_signal\n')
	
	#create the weight reg block
	f.write('\t//Create weight reg block\n')
	f.write('\tWeightRegBank bank(weight, address, write, clk, ')
	for i in range(numUnits):
		f.write('weightWire'+str(i))
		if i != (numUnits-1):
			f.write(', ')
	f.write(');\n')
	
	#create Elliot Function
	f.write('\t//Create Elliot Function\n')
	f.write('\tElliot_Activation elliot(sumWire, elliotTrigger, clk, elliotWire, elliot_end_signal)\n')
	
	#create summer
	f.write('\t//Create summer\n')
	f.write('\t//TODO: Write code for summer\n')
	
	#create layer mux
	f.write('\t//Create layer mux\n')
	f.write('\t//TODO: Write code for layer mux\n')
	
	#create shifters
	f.write('\t//Create shifters\n')
	for i in range(numUnits):
		f.write('\tShifter shifter'+str(i)+'(input'+str(i)+', weightWire'+str(i)+', clk, shiftWire'+str(i)+');\n')
	f.write('endmodule')
