`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:52:53 05/14/2014 
// Design Name: 
// Module Name:    RAM_Read_Driver 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module RAM_Read_Driver(start,layer,reset,clk,RAM_address,unit_sel,unit_address,write,sum_trigger);
input start,reset,clk;
input [1:0] layer;
output reg [9:0] RAM_address;
//output reg [1:0] unit_adress;
output reg [1:0] unit_sel,unit_address; //TODO: Python
output reg write, sum_trigger;

reg [2:0] state, nextstate;
reg [2:0] count, unitcount; //TODO: Python

always @ (posedge clk) begin
	state <= nextstate;
	if(reset==1)
		state <= 0;
end

always @ (state or start or count or unitcount) begin //state or start
	case(state)
		0: begin
			if(start==1)
				nextstate <= 1;
			else
				nextstate <= 0;
			end
		1: begin 
			nextstate <= 2;
			end
		2: begin
			if(count == 4) nextstate <= 4; //TODO: Python
			else nextstate <= 3;
			end
		3: begin //stall one cycle for ram latency
			nextstate <= 1;
			end
		4: begin //update unit while stalling for ram latency
			nextstate <= 5;
			end
		5: begin //check unit count
			if(unitcount == 4) nextstate <= 6; //TODO: Python
			else nextstate <= 1;
			end
		6: begin
			nextstate <= 7;
			end
		7: begin
			nextstate <= 0;
			end
		default: begin
			nextstate <= 0;
			end
	endcase
end

always @ (posedge clk) begin
	if(reset == 1) begin
		RAM_address <= 0;
		unit_sel <= 0;
		unit_address <= 0;
		write <= 0;
		sum_trigger <= 0;
		count <= 0;
		unitcount <= 0;
		end
	else case(state)
		0: begin
			if(layer == 0)
				RAM_address <= 0;
			else if(layer == 1)
				RAM_address <= 16;
			else if(layer == 2)
				RAM_address <= 32;
			unit_sel <= 0;
			unit_address <= 0;
			write <= 0;
			sum_trigger <= 0;
			count <= 0;
			unitcount <= 0;
			end
		1: begin 
			RAM_address <= RAM_address;
			unit_sel <= unit_sel;
			unit_address <= unit_address;
			write <= 1;
			sum_trigger <= 0;
			count <= count + 1;
			unitcount <= unitcount;
			end
		2: begin
			RAM_address <= RAM_address + 1;
			unit_sel <= unit_sel;
			unit_address <= unit_address + 1;
			write <= 0;
			sum_trigger <= 0;
			count <= count;
			unitcount <= unitcount;
			end
		3: begin //stall one cycle for ram latency
			RAM_address <= RAM_address;
			unit_sel <= unit_sel;
			unit_address <= unit_address;
			write <= 0;
			sum_trigger <= 0;
			count <= count;
			unitcount <= unitcount;
			end
		4: begin //update unit while stalling for ram latency
			RAM_address <= RAM_address;
			unit_sel <= unit_sel + 1;
			unit_address <= 0;
			write <= 0;
			sum_trigger <= 0;
			count <= 0;
			unitcount <= unitcount + 1;
			end
		5: begin //check unit count
			RAM_address <= RAM_address;
			unit_sel <= unit_sel;
			unit_address <= unit_address;
			write <= 0;
			sum_trigger <= 0;
			count <= count;
			unitcount <= unitcount;
			end
		6: begin
			RAM_address <= RAM_address;
			unit_sel <= unit_sel;
			unit_address <= unit_address;
			write <= 0;
			sum_trigger <= 1;
			count <= count;
			unitcount <= unitcount;
			end
		7: begin
			RAM_address <= RAM_address;
			unit_sel <= unit_sel;
			unit_address <= unit_address;
			write <= 0;
			sum_trigger <= 1;
			count <= count;
			unitcount <= unitcount;
			end
		default: begin
			RAM_address <= 0;
			unit_sel <= 0;
			unit_address <= 0;
			write <= 0;
			sum_trigger <= 0;
			count <= 0;
			unitcount <= 0;
			end
	endcase
end

endmodule
