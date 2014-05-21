`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: Network
// Project Name: Neural Network
// Description:  
// 
//////////////////////////////////////////////////////////////////////////////////
module Network(start, reset, clk, done, out);
input start, reset, clk;
output done, out;

wire network_start, ram_control_start, layer_sel, ram_write, rom_write, ram_write0, ram_write1, ram_write2, ram_write3, sum_trigger, done0, done1, done2, done3, done;
wire [1:0] layer, unit_sel, ram_write, rom_out, data_reg_address, unit_address;
wire [7:0] weight0, weight1, weight2, weight3;
wire [31:0] data0, data1, data2, data3, unit0, unit1, unit2, unit3;

//module Network_Controller(start,done,reset,clk,layer_sel,[1:0]layer,RAM_Controll_Start);
Network_Controller network_controller(.start(network_start),.done(done),.reset(reset),.clk(clk),.layer_sel(layer_sel),.layer(layer),.RAM_Controll_Start(ram_control_start));

//module RAM_Read_Driver(start,layer,reset,clk,RAM_address,unit_sel,unit_address,write,sum_trigger);
RAM_Read_Driver ram_read_driver(.start(ram_control_start),.layer(layer),.reset(reset),.clk(clk),.RAM_address(),.unit_sel(unit_sel),.unit_address(unit_address),.write(ram_write),.sum_trigger(sum_trigger));

//module RAMMux([7:0] ram_out,[1:0] unit_sel,write,[7:0] weight0,write0,[7:0] weight1,write1,[7:0] weight2,write2,[7:0] weight3,write3);
RAMMux ram_mux(.ram_out(),.unit_sel(unit_sel),write(ram_write),.weight0(weight0),.write0(ram_write0),.weight1(weight1),.write1(ram_write1),.weight2(weight2),.write2(ram_write2),.weight3(weight3),.write3(ram_write3));

//module ROM_Controller(start, clk, reset, [0:31] rom_output, [1:0] address, writeData, start_network_controller);
ROM_Controller rom_controller(.start(start), .clk(clk), .reset(reset), .rom_output(rom_out), .address(data_reg_address), .writeData(rom_write), .start_network_controller(network_start));

//module DataRegBank([31:0]in0, in1, in2, in3, dataIn, [1:0]address, writeAddress, writeAll, clk, [31:0]out0, out1, out2, out3);
DataRegBank data_reg_bank(.in0(unit0), .in1(unit1), .in2(unit2), .in3(unit3), .dataIn(rom_out), .address(data_reg_address), .writeAddress(rom_write), .writeAll(done), .clk(clk), .out0(data0), .out1(data1), .out2(data2), .out3(data3));

//module NeuralUnit(input0,input1,input2,input3,weight,address,write,sumTrigger,layer_Sel,reset,clk,layerOut,layerDone);
NeuralUnit neural_unit0(.input0(data0),.input1(data1),.input2(data2),.input3(data3),.weight(weight0),.address(unit_address),.write(ram_write0),.sumTrigger(sum_trigger),.layer_Sel(layer_sel),.reset(reset),.clk(clk),.layerOut(unit0),.layerDone(done0));
NeuralUnit neural_unit1(.input0(data0),.input1(data1),.input2(data2),.input3(data3),.weight(weight1),.address(unit_address),.write(ram_write1),.sumTrigger(sum_trigger),.layer_Sel(layer_sel),.reset(reset),.clk(clk),.layerOut(unit1),.layerDone(done1));
NeuralUnit neural_unit2(.input0(data0),.input1(data1),.input2(data2),.input3(data3),.weight(weight2),.address(unit_address),.write(ram_write2),.sumTrigger(sum_trigger),.layer_Sel(layer_sel),.reset(reset),.clk(clk),.layerOut(unit2),.layerDone(done2));
NeuralUnit neural_unit3(.input0(data0),.input1(data1),.input2(data2),.input3(data3),.weight(weight3),.address(unit_address),.write(ram_write3),.sumTrigger(sum_trigger),.layer_Sel(layer_sel),.reset(reset),.clk(clk),.layerOut(unit3),.layerDone(done3));


//module MassAnd(CLOCK,reset,in0,in1,in2,in3,done);
MassAnd mass_and(.CLOCK(clk),.reset(reset),.in0(done0),.in1(done1),.in2(done2),.in3(done3),.done(done));

endmodule
