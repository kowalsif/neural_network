`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: DataRegBank Test Fixture
// Project Name: Distributed Brain
// Description:  
// 
//////////////////////////////////////////////////////////////////////////////////

module Data_Reg_Bank_TB();
reg [31:0] in0, in1, in2, in3, dataIn;
reg [1:0] address;
reg writeAddress, writeAll, clk;
wire [31:0] out0, out1, out2, out3;

DataRegBank UUT(in0, in1, in2, in3, dataIn, address, writeAddress, writeAll, clk, out0, out1, out2, out3);

initial begin
clk = 0; dataIn = 0; address = 0; writeAddress = 0;
in0 = 0; in1 = 0; in2 = 0; in3 = 0; writeAll = 0; #5;
in0 = 0; in1 = 0; in2 = 0; in3 = 0; writeAll = 1; #5;
in0 = 0; in1 = 0; in2 = 0; in3 = 0; writeAll = 0; #5;

dataIn = 0; address = 0; writeAddress = 0; #5;
dataIn = 0; address = 0; writeAddress = 1; #5;
dataIn = 0; address = 0; writeAddress = 0; #5;

dataIn = 1; address = 1; writeAddress = 0; #5;
dataIn = 1; address = 1; writeAddress = 1; #5;
dataIn = 1; address = 1; writeAddress = 0; #5;

dataIn = 2; address = 2; writeAddress = 0; #5;
dataIn = 2; address = 2; writeAddress = 1; #5;
dataIn = 2; address = 2; writeAddress = 0; #5;

dataIn = 3; address = 3; writeAddress = 0; #5;
dataIn = 3; address = 3; writeAddress = 1; #5;
dataIn = 3; address = 3; writeAddress = 0; #5;

in0 = 10; in1 = 11; in2 = 12; in3 = 13; writeAll = 0; #5;
in0 = 10; in1 = 11; in2 = 12; in3 = 13; writeAll = 1; #5;
in0 = 10; in1 = 11; in2 = 12; in3 = 13; writeAll = 0; #5;

$stop;
end

always #1 clk = ~clk;

endmodule