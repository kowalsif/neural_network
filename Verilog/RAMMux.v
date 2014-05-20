`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: RAMMux_py
// Project Name: Brain Network
// Description:  
// 
//////////////////////////////////////////////////////////////////////////////////

module RAMMux(
input [7:0] ram_out,
input [1:0] unit_sel,
input write,
output reg [7:0] weight0,output reg write0,
output reg [7:0] weight1,output reg write1,
output reg [7:0] weight2,output reg write2,
output reg [7:0] weight3,output reg write3
);

always@(ram_out or unit_sel or write)	begin
 	case(unit_sel)
	0: begin
		weight0<=ram_out;
		write0<=write;
		weight1<=0;
		write1<=0;
		weight2<=0;
		write2<=0;
		weight3<=0;
		write3<=0;
		end
	1: begin
		weight0<=0;
		write0<=0;
		weight1<=ram_out;
		write1<=write;
		weight2<=0;
		write2<=0;
		weight3<=0;
		write3<=0;
		end
	2: begin
		weight0<=0;
		write0<=0;
		weight1<=0;
		write1<=0;
		weight2<=ram_out;
		write2<=write;
		weight3<=0;
		write3<=0;
		end
	3: begin
		weight0<=0;
		write0<=0;
		weight1<=0;
		write1<=0;
		weight2<=0;
		write2<=0;
		weight3<=ram_out;
		write3<=write;
		end
	default: begin
		weight0<=0;
		write0<=0;
		weight1<=0;
		write1<=0;
		weight2<=0;
		write2<=0;
		weight3<=0;
		write3<=0;
		end
	endcase
	end
endmodule
