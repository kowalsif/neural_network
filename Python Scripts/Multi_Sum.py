import unit_generation
import math

def MultiSum(numUnits):
	f = open('Multi_Sum_PY.v', 'w')
	f.write('`timescale 1ns / 1ps\n')
	f.write(unit_generation.header('MultiSum', ' '))
	
	#module declaration
	f.write('module MultiSum(')
	for i in range(numUnits):
		f.write('in{}, '.format(i))
	f.write('start, clk, reset, sum, done);\n')

	#input declaration
	f.write('input [31:0] in0')
	for i in range(1, numUnits):
		f.write(', in{}'.format(i))
	f.write(';\ninput start, clk, reset;\n')
	
	#output declaration
	f.write('output reg [31:0] sum;\n')
	f.write('output reg done;\n\n')
	addressSize = int(math.ceil(math.log(numUnits+1)/math.log(2)))-1
	f.write('reg [{}:0] state;\n'.format(addressSize))
	f.write('reg [{}:0] nextstate;\n\n'.format(addressSize))
	
	#main block
	f.write('always @ (posedge clk) begin\n')
	f.write('\tif(reset == 1) state <= 0;\n')
	f.write('\telse state <= nextstate;\n')
	f.write('end\n\n')
	
	f.write('always @ (state or start) begin\n')
	f.write('\tcase(state)\n')
	
	f.write('\t\t0: begin\n')
	f.write('\t\t\tif(start == 1) nextstate <= 1;\n')
	f.write('\t\t\telse nextstate <= 0;\n')
	f.write('\t\tend\n')
	
	for i in range(1,numUnits+1):
		f.write('\t\t{}: begin\n'.format(i))
		f.write('\t\t\tnextstate <= {};\n'.format(i+1))
		f.write('\t\tend\n')
		
	f.write('\t\t{}: begin\n'.format(numUnits+1))
	f.write('\t\t\tnextstate <= 0;\n')
	f.write('\t\tend\n')
	
	f.write('\t\tdefault: begin\n')
	f.write('\t\t\tnextstate <= 0;\n')
	f.write('\t\tend\n')
	f.write('\tendcase\n')
	f.write('end\n\n')
	
	f.write('always @ (posedge clk) begin\n')
	f.write('\tif(reset==1) begin\n')
	f.write('\t\tsum <= 0;\n')
	f.write('\t\tdone <= 0;\n')
	f.write('\tend\n')
	
	f.write('\telse case(state)\n')
	f.write('\t\t0: begin\n')
	f.write('\t\t\tsum<=sum;\n')
	f.write('\t\t\tdone<=0;\n')
	f.write('\t\tend\n')
	
	for i in range(1,numUnits+1):
		f.write('\t\t{}: begin\n'.format(i))
		if(i==1):
			f.write('\t\t\tsum <= in{};\n'.format(i-1))
		else:
			f.write('\t\t\tsum <= sum + in{};\n'.format(i-1))
		f.write('\t\t\tdone <= 0;\n')
		f.write('\t\tend\n')
		
	f.write('\t\t{}: begin\n'.format(numUnits+1))
	f.write('\t\t\tsum <= sum;\n')
	f.write('\t\t\tdone <= 1;\n')
	f.write('\t\tend\n')
	
	f.write('\t\tdefault: begin\n')
	f.write('\t\t\tsum <= 0;\n')
	f.write('\t\t\tdone <= 0;\n')
	f.write('\t\tend\n')
	f.write('\tendcase\n')
	f.write('end\n')
	f.write('endmodule\n')
	
def MultiSumTB(numUnits):
	f = open('MultiSum_TB_PY.v', 'w')
	f.write('`timescale 1ns / 1ps\n')
	f.write(unit_generation.header('MultiSum Test Fixture', ' '))
	
	f.write('module MultiSum_TB();\n')
	f.write('reg [31:0] in0')
	for i in range(1,numUnits):
		f.write(', in{}'.format(i))
	f.write(';\nreg start, clk;\n')
	f.write('wire [31:0] sum;\n')
	f.write('wire done;\n\n')
	
	f.write('reg [5:0] count = 0;\n\n')
	
	f.write('MultiSum UUT(')
	for i in range(numUnits):
		f.write('in{}, '.format(i))
	f.write('start, clk, sum, done);\n\n')
	
	f.write('initial begin\n')
	f.write('\tclk=0;\n')
	f.write('\t')
	for i in range(numUnits):
		f.write('in{}=0; '.format(i))
	f.write('start=0; #5;\n')
	f.write('\tstart=1; #2;\n')
	f.write('\tstart=0;\n')
	f.write('end\n\n')
	
	f.write('always @ (posedge done) begin\n')
	f.write('\tif(count==3) begin #5; $stop; end\n\t')
	for i in range(numUnits):
		f.write('in{}=count*{}+1; '.format(i,i+1))
	f.write('start=0; #5;\n')
	f.write('\tstart=1; #2;\n')
	f.write('\tstart=0;\n')
	f.write('\tcount=count+1;\n')
	f.write('end\n\n')
	
	f.write('always #1 clk = ~clk;\n\n')
	f.write('endmodule\n')