import unit_generation
import math

def NetworkUnit(numUnits):
        f= open('Network.v', 'w')
        f.write(unit_generation.header('Network', 'For '+str(numUnits)+' units'))

        #inputs 
        f.write('module Network(\n')
        f.write('\tinput start,\n')
        f.write('\tinput reset,\n')
        f.write('\tinput sysclk,\n')

        #outputs
        f.write('\toutput done,\n')
        f.write('\toutput rez\n\t);\n\n')
        

        #wires
        #1-bit
        f.write('wire clk, layer_sel, RAM_controll_start,write0,write1,write2,write3,layerDone0,layerDone1,layerDone2,layerDone3, sumTrigger,start_network_controller,lock,writeData;\n')
        #log2(numUnits bits)
        f.write('wire ['+str(int(math.log(numUnits)/math.log(2)-1))+':0] layer,unit_addr,rom_address,unit_sel,unit_address;\n\n')
        #8 bits
        f.write('wire [7:0] weight0,weight1,weight2,weight3;\n')
        #10 bits
        f.write('wire [9:0] ram_addr,RAM_address;\n')
        #32 bits
        f.write('wire [31:0] ram_out,input0n0,input1n0,input2n0,input3n0,layerOutn0,out0,out1,out2,out3,layerOutn1,layerOutn2,layerOutn3,rom_output;\n')
        
        #clock
        f.write('clk_wiz_0 clock\n\t(\n\t.clk_in1(sysclk),\n\t.clk_out1(clk),\n\t.reset(reset),\n\t.locked(lock));\n\n')

        #network controller
        f.write('Network_Controller cont(start_network_controller,done,reset,clk,layer_sel,layer,RAM_controll_Start);\n\n')
        
        #data reg bank	
        f.write('DataRegBank bank(');
        for i in range(0,numUnits):
            f.write('layerOutn'+str(i)+',')
        f.write('rom_output, rom_address, writeData, done, clk')
        for i in range(0,numUnits):
            f.write(',out'+str(i));
        f.write(');\n\n')

        #neural units
        for i in range(0,numUnits):
            f.write('NeuralUnit n'+str(i)+'(')
            for j in range(0,numUnits):
                f.write('out'+str(j)+',')
            f.write('weight'+str(i)+'[7:0],unit_address,write'+str(i)+',sumTrigger,layer_sel,clk,layerOutn'+str(i)+',layerDone'+str(i)+');\n\n')
            
        #and unit
        f.write('MassAnd a0(clk')
        for i in range(0,numUnits):
            f.write(',layerDone'+str(i))
        f.write(',done);\n\n')

        #ram multiplexer
        f.write('RAMMux mux(ram_out,unit_sel,ram_write,clk')
        for i in range (0,numUnits):
            f.write(',weight'+str(i)+',write'+str(i))
        f.write(');\n\n')

        #ram read driver
        f.write('RAM_Read_Driver reader(RAM_controll_Start,layer,reset,clk,RAM_address,unit_sel,unit_address,ram_write,sumTrigger);\n\n')
        
        #ram
        f.write('ram_access ram(RAM_address,clk,1\'b0,0,ram_out);\n\n')

        #ROM controller
        f.write('ROM_Controller rom(start,clk,reset,rom_output,rom_address,writeData,start_network_controller);\n\n')

        #black magic and
        f.write('and A0(rez')
        for i in range(0,numUnits):
            f.write(',out'+str(i))
        f.write(');\n\n')

        f.write('endmodule')



