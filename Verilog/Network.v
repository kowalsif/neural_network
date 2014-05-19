//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: Network
// Project Name: FPGA Brain
// Description: For 4 units
// 
//////////////////////////////////////////////////////////////////////////////////

module Network(
	input start,
	input reset,
	input sysclk,
	output done,
	output rez
	);

wire clk, layer_sel, RAM_controll_start,write0,write1,write2,write3,layerDone0,layerDone1,layerDone2,layerDone3, sumTrigger,start_network_controller,lock,writeData;
wire [1:0] layer,unit_addr,rom_address,unit_sel,unit_address;

wire [9:0] ram_addr,RAM_address;
wire [31:0] weight0,weight1,weight2,weight3,ram_out,input0n0,input1n0,input2n0,input3n0,layerOutn0,out0,out1,out2,out3,layerOutn1,layerOutn2,layerOutn3,rom_output;
clk_wiz_0 clock
	(
	.clk_in1(sysclk),
	.clk_out1(clk),
	.reset(reset),
	.locked(lock));

Network_Controller cont(start_network_controller,done,reset,clk,layer_sel,layer,RAM_controll_Start);

DataRegBank bank(layerOutn0,layerOutn1,layerOutn2,layerOutn3,rom_output, rom_address, writeData, done, clk,out0,out1,out2,out3);

NeuralUnit n0(out0,out1,out2,out3,weight0[7:0],unit_address,write0,sumTrigger,layer_sel,clk,layerOutn0,layerDone0);

NeuralUnit n1(out0,out1,out2,out3,weight1[7:0],unit_address,write1,sumTrigger,layer_sel,clk,layerOutn1,layerDone1);

NeuralUnit n2(out0,out1,out2,out3,weight2[7:0],unit_address,write2,sumTrigger,layer_sel,clk,layerOutn2,layerDone2);

NeuralUnit n3(out0,out1,out2,out3,weight3[7:0],unit_address,write3,sumTrigger,layer_sel,clk,layerOutn3,layerDone3);

MassAnd a0(clk,layerDone0,layerDone1,layerDone2,layerDone3,done);

RAMMux mux(ram_out,unit_sel,ram_write,clk,weight0,write0,weight1,write1,weight2,write2,weight3,write3);

RAM_Read_Driver reader(RAM_controll_Start,layer,reset,clk,RAM_address,unit_sel,unit_address,ram_write,sumTrigger);

ram_access ram(RAM_address,clk,1'b0,0,ram_out);

ROM_Controller rom(start,clk,reset,rom_output,rom_address,writeData,start_network_controller);

and A0(rez,out0,out1,out2,out3);

endmodule