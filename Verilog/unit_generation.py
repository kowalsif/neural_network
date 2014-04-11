#README: This program takes a command line argument of the number of units to generate
#This currently generates the Weight_Reg_Bank and its test fixture

import sys
import random
import math

def header(module, description):
	names = ['Neural Network', 'FPGA Brain', 'Brain Network', 'Distributed Brain']
	s = """//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: """ + module +  """
// Project Name: """ + names[random.randint(0,len(names)-1)] + """
// Description: """ + description + """
// 
//////////////////////////////////////////////////////////////////////////////////

"""
	return s
	

def main():
	numUnits = int(sys.argv[1])
	random.seed()
	WeightRegBank(numUnits)
	WeightRegBankTB(numUnits)
	
def WeightRegBank(numUnits):
	f = open('Weight_Reg_Bank.v', 'w')
	f.write(header('WeightRegBank', ' '))
	
	#module declaration
	f.write('module WeightRegBank(dataIn, address, write, clk')
	for i in range(numUnits):
		f.write(', out{}'.format(i))
	f.write(');\n')
	
	#input declaration
	f.write('input [7:0] dataIn;\n')
	addressSize = int(math.ceil(math.log(numUnits)/math.log(2)))-1
	f.write('input [{}:0] address;\n'.format(addressSize))
	f.write('input write, clk;\n')
	
	#output declaration
	f.write('output reg [7:0] out0')
	for i in range(1,numUnits):
		f.write(', out{}'.format(i))
	f.write(';\n\n')
	
	#main block
	f.write('always @ (posedge clk) begin\n')
	f.write('	if(write == 1) begin\n')
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
	f.write('	end\n')
	f.write('end\n')
	f.write('endmodule\n')
	
def WeightRegBankTB(numUnits):
	f = open('Weight_Reg_Bank_TB.v', 'w')
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
	
	

if __name__ == "__main__":
	main()