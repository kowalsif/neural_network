`timescale 1ns / 1ps
module MassAnd_py(
input CLOCK,
input in0,
input in1,
input in2,
input in3,
input in4,
input in5,
output reg done
);

and A0(done,in0,in1,in2,in3,in4,in5);

endmodule
