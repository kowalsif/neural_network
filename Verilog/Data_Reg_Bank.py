import unit_generation
import math

def DataRegBank(numUnits):
	f = open('Data_Reg_Bank.v', 'w')
	f.write(unit_generation.header('DataRegBank', ' '))
	
	#module declaration
	f.write('module DataRegBank(')
	for i in range(numUnits):
		f.write('in{}, '.format(i))
	f.write('dataIn, address, writeAddress, writeAll, clk')
	for i in range(numUnits):
		f.write(', out{}'.format(i))
	f.write(');\n')
	
	#input declaration
	f.write('input [31:0] ')
	for i in range(numUnits):
		f.write('in{}, '.format(i))
	f.write('dataIn;\n')
	addressSize = int(math.ceil(math.log(numUnits)/math.log(2)))-1
	f.write('input [{}:0] address;\n'.format(addressSize))
	f.write('input writeAddress, writeAll, clk;\n')
	
	#output declaration
	f.write('output reg [31:0] out0')
	for i in range(1,numUnits):
		f.write(', out{}'.format(i))
	f.write(';\n\n')
	
	#main block
	f.write('always @ (posedge clk) begin\n')
	f.write('	if(writeAddress == 1) begin\n')
	f.write('		case(address)\n')
	for i in range(numUnits):
		f.write('			{}: begin\n'.format(i))
		for j in range(numUnits):
			if(i==j):
				f.write('				out{} <= dataIn;\n'.format(j))
			else:
				f.write('				out{0} <= out{0};\n'.format(j))
		f.write('				end\n')
	f.write('			default: begin\n')
	for i in range(numUnits):
		f.write('				out{0} <= out{0};\n'.format(i))
	f.write('				end\n')
	f.write('		endcase\n')
	f.write('	end else if (writeAll == 1) begin\n')
	for i in range(numUnits):
		f.write('		out{0} <= in{0};\n'.format(i))
	f.write('	end\n')
	f.write('end\n')
	f.write('endmodule\n')
	
def WeightRegBankTB(numUnits):
	f = open('Data_Reg_Bank_TB_PY.v', 'w')
	f.write('`timescale 1ns / 1ps\n')
	f.write(header('WeightRegBank Test Fixture', ' '))
	
	f.write('module Weight_Reg_Bank_TB();\n')
	f.write('reg [7:0] dataIn;\n')
	addressSize = int(math.ceil(math.log(numUnits)/math.log(2)))-1
	f.write('reg [{}:0] address;\n'.format(addressSize))
	f.write('reg write, clk;\n')
	
	f.write('wire [7:0] out0')
	for i in range(1,numUnits):
		f.write(', out{}'.format(i))
	f.write(';\n\n')
	
	f.write('WeightRegBank UUT(dataIn, address, write, clk')
	for i in range(numUnits):
		f.write(', out{}'.format(i))
	f.write(');\n\n')
	
	f.write('initial begin\n')
	f.write('clk = 0; ')
	for i in range(numUnits):
		f.write('dataIn = {0}; address = {0}; write = 0; #5;\n'.format(i))
		f.write('dataIn = {0}; address = {0}; write = 1; #5;\n'.format(i))
		f.write('dataIn = {0}; address = {0}; write = 0; #5;\n\n'.format(i))
	f.write('$stop;\n')
	f.write('end\n\n')
	
	f.write('always #1 clk = ~clk;\n\n')
	
	f.write('endmodule')