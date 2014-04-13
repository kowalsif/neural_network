`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: WeightRegBank Test Fixture
// Project Name: Brain Network
// Description:  
// 
//////////////////////////////////////////////////////////////////////////////////

module Weight_Reg_Bank_TB();
reg [7:0] dataIn;
reg [3:0] address;
reg write, clk;
wire [7:0] out0, out1, out2, out3, out4, out5, out6, out7, out8, out9;

WeightRegBank UUT(dataIn, address, write, clk, out0, out1, out2, out3, out4, out5, out6, out7, out8, out9);

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

$stop;
end

always #1 clk = ~clk;

endmodule