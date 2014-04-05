`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: WeightRegBank Test Fixture
// Project Name: Distributed Brain
// Description:  
// 
//////////////////////////////////////////////////////////////////////////////////

module Weight_Reg_Bank_TB();
reg [7:0] dataIn;
reg [4:0] address;
reg write, clk;
wire [7:0] out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15, out16, out17, out18, out19, out20, out21, out22, out23, out24, out25, out26, out27, out28, out29;

WeightRegBank UUT(dataIn, address, write, clk, out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15, out16, out17, out18, out19, out20, out21, out22, out23, out24, out25, out26, out27, out28, out29);

initial begin
clk = 0; dataIn = 0; address = 0; write = 0; #5;
dataIn = 0; address = 0; write = 1; #5;
dataIn = 0; address = 0; write = 0; #5;

dataIn = 1; address = 1; write = 0; #5;
dataIn = 1; address = 1; write = 1; #5;
dataIn = 1; address = 1; write = 0; #5;

dataIn = 2; address = 2; write = 0; #5;
dataIn = 2; address = 2; write = 1; #5;
dataIn = 2; address = 2; write = 0; #5;

dataIn = 3; address = 3; write = 0; #5;
dataIn = 3; address = 3; write = 1; #5;
dataIn = 3; address = 3; write = 0; #5;

dataIn = 4; address = 4; write = 0; #5;
dataIn = 4; address = 4; write = 1; #5;
dataIn = 4; address = 4; write = 0; #5;

dataIn = 5; address = 5; write = 0; #5;
dataIn = 5; address = 5; write = 1; #5;
dataIn = 5; address = 5; write = 0; #5;

dataIn = 6; address = 6; write = 0; #5;
dataIn = 6; address = 6; write = 1; #5;
dataIn = 6; address = 6; write = 0; #5;

dataIn = 7; address = 7; write = 0; #5;
dataIn = 7; address = 7; write = 1; #5;
dataIn = 7; address = 7; write = 0; #5;

dataIn = 8; address = 8; write = 0; #5;
dataIn = 8; address = 8; write = 1; #5;
dataIn = 8; address = 8; write = 0; #5;

dataIn = 9; address = 9; write = 0; #5;
dataIn = 9; address = 9; write = 1; #5;
dataIn = 9; address = 9; write = 0; #5;

dataIn = 10; address = 10; write = 0; #5;
dataIn = 10; address = 10; write = 1; #5;
dataIn = 10; address = 10; write = 0; #5;

dataIn = 11; address = 11; write = 0; #5;
dataIn = 11; address = 11; write = 1; #5;
dataIn = 11; address = 11; write = 0; #5;

dataIn = 12; address = 12; write = 0; #5;
dataIn = 12; address = 12; write = 1; #5;
dataIn = 12; address = 12; write = 0; #5;

dataIn = 13; address = 13; write = 0; #5;
dataIn = 13; address = 13; write = 1; #5;
dataIn = 13; address = 13; write = 0; #5;

dataIn = 14; address = 14; write = 0; #5;
dataIn = 14; address = 14; write = 1; #5;
dataIn = 14; address = 14; write = 0; #5;

dataIn = 15; address = 15; write = 0; #5;
dataIn = 15; address = 15; write = 1; #5;
dataIn = 15; address = 15; write = 0; #5;

dataIn = 16; address = 16; write = 0; #5;
dataIn = 16; address = 16; write = 1; #5;
dataIn = 16; address = 16; write = 0; #5;

dataIn = 17; address = 17; write = 0; #5;
dataIn = 17; address = 17; write = 1; #5;
dataIn = 17; address = 17; write = 0; #5;

dataIn = 18; address = 18; write = 0; #5;
dataIn = 18; address = 18; write = 1; #5;
dataIn = 18; address = 18; write = 0; #5;

dataIn = 19; address = 19; write = 0; #5;
dataIn = 19; address = 19; write = 1; #5;
dataIn = 19; address = 19; write = 0; #5;

dataIn = 20; address = 20; write = 0; #5;
dataIn = 20; address = 20; write = 1; #5;
dataIn = 20; address = 20; write = 0; #5;

dataIn = 21; address = 21; write = 0; #5;
dataIn = 21; address = 21; write = 1; #5;
dataIn = 21; address = 21; write = 0; #5;

dataIn = 22; address = 22; write = 0; #5;
dataIn = 22; address = 22; write = 1; #5;
dataIn = 22; address = 22; write = 0; #5;

dataIn = 23; address = 23; write = 0; #5;
dataIn = 23; address = 23; write = 1; #5;
dataIn = 23; address = 23; write = 0; #5;

dataIn = 24; address = 24; write = 0; #5;
dataIn = 24; address = 24; write = 1; #5;
dataIn = 24; address = 24; write = 0; #5;

dataIn = 25; address = 25; write = 0; #5;
dataIn = 25; address = 25; write = 1; #5;
dataIn = 25; address = 25; write = 0; #5;

dataIn = 26; address = 26; write = 0; #5;
dataIn = 26; address = 26; write = 1; #5;
dataIn = 26; address = 26; write = 0; #5;

dataIn = 27; address = 27; write = 0; #5;
dataIn = 27; address = 27; write = 1; #5;
dataIn = 27; address = 27; write = 0; #5;

dataIn = 28; address = 28; write = 0; #5;
dataIn = 28; address = 28; write = 1; #5;
dataIn = 28; address = 28; write = 0; #5;

dataIn = 29; address = 29; write = 0; #5;
dataIn = 29; address = 29; write = 1; #5;
dataIn = 29; address = 29; write = 0; #5;

$stop;
end

always #1 clk = ~clk;

endmodule