`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: RAMMux_py
// Project Name: Neural Network
// Description:  
// 
//////////////////////////////////////////////////////////////////////////////////

module MassAnd(
input CLOCK,
input reset,
input in0,
input in1,
input in2,
input in3,
output done
);

wire andDone;
and A0(andDone,in0,in1,in2,in3);

ClockedOneShot shot(andDone, done, reset, CLOCK) ;

endmodule
