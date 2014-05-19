import unit_generation
import math

def MassAnd(numUnits):
    f = open('MassAnd_py.v', 'w')
    f.write('`timescale 1ns / 1ps\n')
    f.write(unit_generation.header('RAMMux_py', ' '))
    
    #module declaration
    f.write('module MassAnd_py(\n')

    #inputs
    f.write('input CLOCK,\n')
    for i in range(0,numUnits):
        f.write('input in'+str(i)+',\n')

    #outputs
    f.write('output done\n')
    f.write(');\n\n')

    #main block
    f.write('and A0(done,')
    for i in range(0, numUnits):
        f.write('in'+str(i))
        if (i != numUnits-1):
            f.write(',')
    f.write(');\n\n')
	f.write('ClockedOneShot shot(andDone, done, reset, CLOCK) ;\n\n')
    f.write('endmodule\n')
    
