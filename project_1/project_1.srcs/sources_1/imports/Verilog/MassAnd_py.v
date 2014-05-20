`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: RAMMux_py
// Project Name: Brain Network
// Description:  
// 
//////////////////////////////////////////////////////////////////////////////////

module MassAnd_py(
input CLOCK,
input in0,
input in1,
input in2,
input in3,
output done
);

and A0(done,in0,in1,in2,in3);

ClockedOneShot shot(done, done, reset, CLOCK) ;

endmodule
