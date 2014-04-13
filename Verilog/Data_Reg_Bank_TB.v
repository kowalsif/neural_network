`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: DataRegBank Test Fixture
// Project Name: Brain Network
// Description:  
// 
//////////////////////////////////////////////////////////////////////////////////

module Data_Reg_Bank_TB();
reg [31:0] in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, dataIn;
reg [3:0] address;
reg writeAddress, writeAll, clk;
wire [31:0] out0, out1, out2, out3, out4, out5, out6, out7, out8, out9;

DataRegBank UUT(in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, dataIn, address, writeAddress, writeAll, clk, out0, out1, out2, out3, out4, out5, out6, out7, out8, out9);

initial begin
clk = 0; dataIn = 0; address = 0; writeAddress = 0; 
in0 = 0; in1 = 0; in2 = 0; in3 = 0; in4 = 0; in5 = 0; in6 = 0; in7 = 0; in8 = 0; in9 = 0; writeAll = 0; #5;
in0 = 0; in1 = 0; in2 = 0; in3 = 0; in4 = 0; in5 = 0; in6 = 0; in7 = 0; in8 = 0; in9 = 0; writeAll = 1; #5;
in0 = 0; in1 = 0; in2 = 0; in3 = 0; in4 = 0; in5 = 0; in6 = 0; in7 = 0; in8 = 0; in9 = 0; writeAll = 0; #5;

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

dataIn = 4; address = 4; writeAddress = 0; #5;
dataIn = 4; address = 4; writeAddress = 1; #5;
dataIn = 4; address = 4; writeAddress = 0; #5;

dataIn = 5; address = 5; writeAddress = 0; #5;
dataIn = 5; address = 5; writeAddress = 1; #5;
dataIn = 5; address = 5; writeAddress = 0; #5;

dataIn = 6; address = 6; writeAddress = 0; #5;
dataIn = 6; address = 6; writeAddress = 1; #5;
dataIn = 6; address = 6; writeAddress = 0; #5;

dataIn = 7; address = 7; writeAddress = 0; #5;
dataIn = 7; address = 7; writeAddress = 1; #5;
dataIn = 7; address = 7; writeAddress = 0; #5;

dataIn = 8; address = 8; writeAddress = 0; #5;
dataIn = 8; address = 8; writeAddress = 1; #5;
dataIn = 8; address = 8; writeAddress = 0; #5;

dataIn = 9; address = 9; writeAddress = 0; #5;
dataIn = 9; address = 9; writeAddress = 1; #5;
dataIn = 9; address = 9; writeAddress = 0; #5;

in0 = 10; in1 = 11; in2 = 12; in3 = 13; in4 = 14; in5 = 15; in6 = 16; in7 = 17; in8 = 18; in9 = 19; writeAll = 0; #5;
in0 = 10; in1 = 11; in2 = 12; in3 = 13; in4 = 14; in5 = 15; in6 = 16; in7 = 17; in8 = 18; in9 = 19; writeAll = 1; #5;
in0 = 10; in1 = 11; in2 = 12; in3 = 13; in4 = 14; in5 = 15; in6 = 16; in7 = 17; in8 = 18; in9 = 19; writeAll = 0; #5;


$stop;
end

always #1 clk = ~clk;

endmodule