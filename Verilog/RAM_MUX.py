import unit_generation
import math

def RamMux(numUnits):
    f = open('RAMMux.v', 'w')
    f.write('`timescale 1ns / 1ps\n')
    f.write(unit_generation.header('RAMMux', ' '))
    
    #module declaration
    f.write('module RAMMux_py(\n')

    #input declaration
    f.write('input [31:0] ram_out,\n')
    f.write('input ['+str(int(math.ceil(math.log(numUnits)/math.log(2.0))))+':0] unit_sel,\n')
    f.write('input write,\n')
    f.write('input CLOCK,\n')
#   for i in range(1, numUnits):
#       f.write(', in{}'.format(i))
#   f.write(';\ninput start, clk;\n')
    
    #output declaration
    for i in range(0, numUnits):
        f.write('output reg [7:0] weight'+str(i)+',')
        f.write('output reg write'+str(i))
        if (i != numUnits-1):
            f.write(',\n')
    f.write('\n);\n\n')

    
    #main block
    f.write('always@(posedge CLOCK)')
    f.write('\tbegin\n \tcase(unit_sel)\n')
    for i in range (0, numUnits):
        f.write('\t'+str(i)+': begin\n')
        for j in range (0, numUnits):
            if (i != j):
                f.write('\t\tweight'+str(j)+ '<=8\'b00000000;\n')
                f.write('\t\twrite'+str(j)+'<=1\'b0;\n')
            else:
                f.write('\t\tweight'+str(j)+ '<=ram_out[7:0];\n')
                f.write('\t\twrite'+str(j)+'<=write;\n')
        f.write('\t\tend\n')
    f.write('\tdefault: begin\n')
    for i in range(0,numUnits):
        f.write('\t\tweight'+str(i)+ '<=8\'b00000000;\n')
        f.write('\t\twrite'+str(i)+'<=0;\n')
    f.write('\t\tend\n')
    f.write('\tendcase\n\tend\n')

    f.write('endmodule\n')

	
def RAM_M_TB(numUnits):
    f = open('RAM_Mux_TB.v', 'w')
    f.write('`timescale 1ns / 1ps\n')
    f.write(unit_generation.header('MultiSum Test Fixture', ' '))
#	
    f.write('module RAM_Mux_TB();\n')
    f.write('reg [31:0] ram_out;\n')
    f.write('reg ['+str(int(math.ceil(math.log(numUnits)/math.log(2.0))))+':0] unit_sel;\n')
    f.write('reg write;\n')
    f.write('reg CLOCK;\n')

    
    #output declaration
    for i in range(0, numUnits):
        f.write('wire [7:0] weight'+str(i)+';')
        f.write(' wire write'+str(i)+';\n')
    f.write('\n\n')

    f.write('RAMMux_py UUT(')
    f.write('ram_out,unit_sel,write,CLOCK')
    for i in range (0,numUnits):
        f.write(',weight'+str(i)+',write'+str(i))
    f.write(');\n\n')

    f.write('initial begin\n')
    ram = 1
    f.write('\tCLOCK=0; write=0;ram_out='+str(ram)+'; unit_sel=0; #5\n')
    for i in range(0, numUnits):
        f.write('\tunit_sel='+str(i)+'; write=1; ram_out='+str(ram)+';#5;\n')
        f.write('\twrite=0; #5;\n')
        ram*=2
        
    f.write('end\n')
    f.write('always #1 CLOCK = ~CLOCK;\n\n')
    f.write('endmodule')

#	
#	f.write('initial begin\n')
#	f.write('\tclk=0;\n')
#	f.write('\t')
#	for i in range(numUnits):
#		f.write('in{}=0; '.format(i))
#	f.write('start=0; #5;\n')
#	f.write('\tstart=1; #2;\n')
#	f.write('\tstart=0;\n')
#	f.write('end\n\n')
#	
#	f.write('always @ (posedge done) begin\n')
#	f.write('\tif(count==3) begin #5; $stop; end\n\t')
#	for i in range(numUnits):
#		f.write('in{}=count*{}+1; '.format(i,i+1))
#	f.write('start=0; #5;\n')
#	f.write('\tstart=1; #2;\n')
#	f.write('\tstart=0;\n')
#	f.write('\tcount=count+1;\n')
#	f.write('end\n\n')
	
#	f.write('always #1 clk = ~clk;\n\n')
#	f.write('endmodule\n')
