import unit_generation
import math

def RAMReadDriver(numUnits):
	address = int(math.ceil(math.log(numUnits)/math.log(2)))
	f = open('RAM_Read_Driver.v', 'w')
	f.write('`timescale 1ns / 1ps\n')
	f.write(unit_generation.header('RAMReadDriver', 'For '+str(numUnits)+' units'))
	f.write('module RAM_Read_Driver(start,layer,reset,clk,RAM_address,unit_sel,unit_address,write,sum_trigger);\n')
	f.write('input start,reset,clk;\n')
	f.write('input [1:0] layer;\n')
	f.write('output reg [31:0] RAM_address;\n')
	f.write('output reg [{}:0] unit_sel,unit_address;\n'.format(address))
	f.write('output reg write, sum_trigger;\n\n')
	
	f.write('reg [{}:0] state, nextstate, count, unitcount;\n\n'.format(address))
	
	f.write('always @ (posedge clk) begin\n')
	f.write('\tstate <= nextstate;\n')
	f.write('\tif(reset==1)\n')
	f.write('\t\tstate <= 0;\n')
	f.write('end\n\n')
	
	f.write('always @ (state or start) begin\n')
	f.write('\tcase(state)\n')
	
	#state 0
	f.write('\t\t0: begin\n')
	f.write('\t\t\tRAM_address <= 0;\n')
	f.write('\t\t\tunit_sel <= 0;\n')
	f.write('\t\t\tunit_address <= 0;\n')
	f.write('\t\t\twrite <= 0;\n')
	f.write('\t\t\tsum_trigger <= 0;\n')
	f.write('\t\t\tcount <= 0;\n')
	f.write('\t\t\tunitcount <= 0;\n')
	f.write('\t\t\tif(start==1)\n')
	f.write('\t\t\t\tnextstate <= 1;\n')
	f.write('\t\t\telse\n')
	f.write('\t\t\t\tnextstate <= 0;\n')
	f.write('\t\t\tend\n')
	
	#state 1
	f.write('\t\t1: begin\n')
	f.write('\t\t\tRAM_address <= RAM_address;\n')
	f.write('\t\t\tunit_sel <= unit_sel;\n')
	f.write('\t\t\tunit_address <= unit_address;\n')
	f.write('\t\t\twrite <= 1;\n')
	f.write('\t\t\tsum_trigger <= 0;\n')
	f.write('\t\t\tcount <= count + 1;\n')
	f.write('\t\t\tunitcount <= unitcount;\n')
	f.write('\t\t\tnextstate <= 2;\n')
	f.write('\t\t\tend\n')
	
	#state 2
	f.write('\t\t2: begin\n')
	f.write('\t\t\tRAM_address <= RAM_address + 1;\n')
	f.write('\t\t\tunit_sel <= unit_sel;\n')
	f.write('\t\t\tunit_address <= unit_address + 1;\n')
	f.write('\t\t\twrite <= 0;\n')
	f.write('\t\t\tsum_trigger <= 0;\n')
	f.write('\t\t\tcount <= count;\n')
	f.write('\t\t\tunitcount <= unitcount;\n')
	f.write('\t\t\tif(count == {}) nextstate <= 4;\n'.format(numUnits))
	f.write('\t\t\telse nextstate <= 3;\n')
	f.write('\t\t\tend\n')
	
	#state 3
	f.write('\t\t3: begin //stall one cycle for ram latency\n')
	f.write('\t\t\tRAM_address <= RAM_address;\n')
	f.write('\t\t\tunit_sel <= unit_sel;\n')
	f.write('\t\t\tunit_address <= unit_address;\n')
	f.write('\t\t\twrite <= 0;\n')
	f.write('\t\t\tsum_trigger <= 0;\n')
	f.write('\t\t\tcount <= count;\n')
	f.write('\t\t\tunitcount <= unitcount;\n')
	f.write('\t\t\tnextstate <= 1;\n')
	f.write('\t\t\tend\n')
	
	#state 4
	f.write('\t\t4: begin //update unit while stalling for ram latency\n')
	f.write('\t\t\tRAM_address <= RAM_address;\n')
	f.write('\t\t\tunit_sel <= unit_sel + 1;\n')
	f.write('\t\t\tunit_address <= 0;\n')
	f.write('\t\t\twrite <= 0;\n')
	f.write('\t\t\tsum_trigger <= 0;\n')
	f.write('\t\t\tcount <= 0;\n')
	f.write('\t\t\tunitcount <= unitcount + 1;\n')
	f.write('\t\t\tnextstate <= 5;\n')
	f.write('\t\t\tend\n')
	
	#state 5
	f.write('\t\t5: begin //check unit count\n')
	f.write('\t\t\tRAM_address <= RAM_address;\n')
	f.write('\t\t\tunit_sel <= unit_sel;\n')
	f.write('\t\t\tunit_address <= unit_address;\n')
	f.write('\t\t\twrite <= 0;\n')
	f.write('\t\t\tsum_trigger <= 0;\n')
	f.write('\t\t\tcount <= count;\n')
	f.write('\t\t\tunitcount <= unitcount;\n')
	f.write('\t\t\tif(unitcount == {}) nextstate <= 6;\n'.format(numUnits))
	f.write('\t\t\telse nextstate <= 1;\n')
	f.write('\t\t\tend\n')
	
	#state 6
	f.write('\t\t6: begin\n')
	f.write('\t\t\tRAM_address <= RAM_address;\n')
	f.write('\t\t\tunit_sel <= unit_sel;\n')
	f.write('\t\t\tunit_address <= unit_address;\n')
	f.write('\t\t\twrite <= 0;\n')
	f.write('\t\t\tsum_trigger <= 1;\n')
	f.write('\t\t\tcount <= count;\n')
	f.write('\t\t\tunitcount <= unitcount;\n')
	f.write('\t\t\tnextstate <= 7;\n')
	f.write('\t\t\tend\n')
	
	#state 7
	f.write('\t\t7: begin\n')
	f.write('\t\t\tRAM_address <= RAM_address;\n')
	f.write('\t\t\tunit_sel <= unit_sel;\n')
	f.write('\t\t\tunit_address <= unit_address;\n')
	f.write('\t\t\twrite <= 0;\n')
	f.write('\t\t\tsum_trigger <= 0;\n')
	f.write('\t\t\tcount <= count;\n')
	f.write('\t\t\tunitcount <= unitcount;\n')
	f.write('\t\t\tnextstate <= 0;\n')
	f.write('\t\t\tend\n')
	
	f.write('\t\tendcase\n')
	f.write('\tend\n')
	f.write('endmodule\n')
	f.close()