import unit_generation
import math

def DataRegBank(numUnits):
    f = open('Data_Reg_Bank.v', 'w')
    f.write(unit_generation.header('DataRegBank', 'For '+str(numUnits)+' units'))
    
    #module declaration
    f.write('module DataRegBank(')
    for i in range(numUnits):
        f.write('in{}, '.format(i))
    f.write('dataIn, address, writeAddress, writeAll, reset, clk')
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
    f.write('input writeAddress, writeAll, reset, clk;\n')
    
    #output declaration
    f.write('output reg [31:0] out0')
    for i in range(1,numUnits):
        f.write(', out{}'.format(i))
    f.write(';\n\n')
    
    #main block
    f.write('always @ (posedge clk) begin\n')
    f.write('\tif (reset == 1) begin \n')
    for i in range (numUnits):
        f.write('\t\tout{} <= 0;\n'.format(i))
    f.write('\tend\n')
    f.write('   else if(writeAddress == 1) begin\n')
    f.write('       case(address)\n')
    for i in range(numUnits):
        f.write('           {}: begin\n'.format(i))
        for j in range(numUnits):
            if(i==j):
                f.write('               out{} <= dataIn;\n'.format(j))
            else:
                f.write('               out{0} <= out{0};\n'.format(j))
        f.write('               end\n')
    f.write('           default: begin\n')
    for i in range(numUnits):
        f.write('               out{0} <= out{0};\n'.format(i))
    f.write('               end\n')
    f.write('       endcase\n')
    f.write('   end else if (writeAll == 1) begin\n')
    for i in range(numUnits):
        f.write('       out{0} <= in{0};\n'.format(i))
    f.write('   end\n')
    f.write('end\n')
    f.write('endmodule\n')
    
def DataRegBankTB(numUnits):
    f = open('Data_Reg_Bank_TB.v', 'w')
    f.write('`timescale 1ns / 1ps\n')
    f.write(unit_generation.header('DataRegBank Test Fixture', ' '))
    
    f.write('module Data_Reg_Bank_TB();\n')
    f.write('reg [31:0] ')
    for i in range(numUnits):
        f.write('in{}, '.format(i))
    f.write('dataIn;\n')
    addressSize = int(math.ceil(math.log(numUnits)/math.log(2)))-1
    f.write('reg [{}:0] address;\n'.format(addressSize))
    f.write('reg writeAddress, writeAll, clk;\n')
    
    f.write('wire [31:0] out0')
    for i in range(1,numUnits):
        f.write(', out{}'.format(i))
    f.write(';\n\n')
    
    f.write('DataRegBank UUT(')
    for i in range(numUnits):
        f.write('in{}, '.format(i))
    f.write('dataIn, address, writeAddress, writeAll, clk')
    for i in range(numUnits):
        f.write(', out{}'.format(i))
    f.write(');\n\n')
    
    f.write('initial begin\n')
    f.write('clk = 0; dataIn = 0; address = 0; writeAddress = 0;\n')
    for i in range(numUnits):
        f.write('in{} = 0; '.format(i))
    f.write('writeAll = 0; #5;\n')
    for i in range(numUnits):
        f.write('in{} = 0; '.format(i))
    f.write('writeAll = 1; #5;\n')
    for i in range(numUnits):
        f.write('in{} = 0; '.format(i))
    f.write('writeAll = 0; #5;\n\n')
    for i in range(numUnits):
        f.write('dataIn = {0}; address = {0}; writeAddress = 0; #5;\n'.format(i))
        f.write('dataIn = {0}; address = {0}; writeAddress = 1; #5;\n'.format(i))
        f.write('dataIn = {0}; address = {0}; writeAddress = 0; #5;\n\n'.format(i))
    for i in range(numUnits):
        f.write('in{} = {}; '.format(i,10+i))
    f.write('writeAll = 0; #5;\n')
    for i in range(numUnits):
        f.write('in{} = {}; '.format(i,10+i))
    f.write('writeAll = 1; #5;\n')
    for i in range(numUnits):
        f.write('in{} = {}; '.format(i,10+i))
    f.write('writeAll = 0; #5;\n\n')
    f.write('$stop;\n')
    f.write('end\n\n')
    
    f.write('always #1 clk = ~clk;\n\n')
    
    f.write('endmodule')
