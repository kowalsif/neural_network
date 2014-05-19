`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2014 03:53:10 PM
// Design Name: 
// Module Name: Network
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Network(
    input start,
    input reset,
    input sysclk,
    output done,
    output rez,
    output [31:0] result 
    );

    
    
wire clk, layer_sel, RAM_controll_start,write0,write1,write2,write3,layerDone0,layerDone1,layerDone2,layerDone3, sumTrigger,start_network_controller,lock,writeData;
wire [1:0] layer,unit_addr,rom_address;
wire [1:0] unit_sel,unit_address;
wire [31:0] weight0,weight1,weight2,weight3;
wire [9:0] ram_addr,RAM_address;
wire [31:0] ram_out,input0n0,input1n0,input2n0,input3n0,out0,out1,out2,out3,layerOutn0,layerOutn1,layerOutn2,layerOutn3,rom_output;

//assign clk = sysclk;
assign result = layerOutn0;


//clk_wiz_0 clock
//   (
//   // Clock in ports
//    .clk_in1(sysclk),      // input clk_in1
//    // Clock out ports
//    .clk_out1(clk),     // output clk_out1
//    // Status and control signals
//    .reset(reset),// input reset
//    .locked(lock));      // output locked



//start done reset clk layer_sel Ram_controll_start, hooked up
Network_Controller cont(start_network_controller,done,reset,clk,layer_sel,layer,RAM_controll_Start);

//layer, rom_out, !rom_addr, !write_addr, done, clk, out0, out1, out2, out3 !hooked up
DataRegBank bank(layerOutn0, layerOutn1, layerOutn2, layerOutn3, rom_output, rom_address, writeData, done, clk, out0, out1, out2, out3);

//out0 out1 out2 out3 weight0 hooked up
NeuralUnit n0(out0,out1,out2,out3,weight0[7:0],unit_address,write0,sumTrigger,layer_sel,clk,layerOutn0,layerDone0);
//out0 out1 out2 out3 weight0 hooked up
NeuralUnit n1(out0,out1,out2,out3,weight1[7:0],unit_address,write1,sumTrigger,layer_sel,clk,layerOutn1,layerDone1);
//out0 out1 out2 out3 weight0 hooked up
NeuralUnit n2(out0,out1,out2,out3,weight2[7:0],unit_address,write2,sumTrigger,layer_sel,clk,layerOutn2,layerDone2);
//out0 out1 out2 out3 weight0 hooked up
NeuralUnit n3(out0,out1,out2,out3,weight3[7:0],unit_address,write3,sumTrigger,layer_sel,clk,layerOutn3,layerDone3);
//hooked up
MassAnd_py a0(clk, reset, layerDone0,layerDone1,layerDone2,layerDone3,done);

// ram_out unit_selram_write clk hooked up
RAMMux_py mux(ram_out,unit_sel,ram_write,clk,weight0,write0,weight1,write1,weight2,write2,weight3,write3);

RAM_Read_Driver reader(RAM_controll_Start,layer,reset,clk,RAM_address,unit_sel,unit_address,ram_write,sumTrigger);

//hooked up
ram_access ram(RAM_address,clk,1'b0,0,ram_out);

//hooked up 
ROM_Controller rom(start,clk,reset,rom_output,rom_address,writeData,start_network_controller);

and A0(rez,out0,out1,out2,out3);

endmodule


