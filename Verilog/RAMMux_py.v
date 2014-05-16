`timescale 1ns / 1ps
module RAMMux_py(
input [31:0] ram_out,
input [3:0] unit_sel,
input write,
input CLOCK,
output reg [31:0] weight0,output reg write0,
output reg [31:0] weight1,output reg write1,
output reg [31:0] weight2,output reg write2,
output reg [31:0] weight3,output reg write3,
output reg [31:0] weight4,output reg write4,
output reg [31:0] weight5,output reg write5
);

always@(posedge CLOCK)	begin
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
		weight4<=0;
		write4<=0;
		weight5<=0;
		write5<=0;
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
		weight4<=0;
		write4<=0;
		weight5<=0;
		write5<=0;
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
		weight4<=0;
		write4<=0;
		weight5<=0;
		write5<=0;
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
		weight4<=0;
		write4<=0;
		weight5<=0;
		write5<=0;
		end
	4: begin
		weight0<=0;
		write0<=0;
		weight1<=0;
		write1<=0;
		weight2<=0;
		write2<=0;
		weight3<=0;
		write3<=0;
		weight4<=ram_out;
		write4<=write;
		weight5<=0;
		write5<=0;
		end
	5: begin
		weight0<=0;
		write0<=0;
		weight1<=0;
		write1<=0;
		weight2<=0;
		write2<=0;
		weight3<=0;
		write3<=0;
		weight4<=0;
		write4<=0;
		weight5<=ram_out;
		write5<=write;
		end
	default: begin
		weight5<=0;
		write5<=0;
		weight5<=0;
		write5<=0;
		weight5<=0;
		write5<=0;
		weight5<=0;
		write5<=0;
		weight5<=0;
		write5<=0;
		weight5<=0;
		write5<=0;
		end
	endcase
	end
endmodule
