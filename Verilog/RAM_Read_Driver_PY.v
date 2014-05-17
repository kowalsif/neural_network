`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: RAMReadDriver
// Project Name: Distributed Brain
// Description: For 4 units
// 
//////////////////////////////////////////////////////////////////////////////////

module RAM_Read_Driver(start,layer,reset,clk,RAM_address,unit_sel,unit_address,write,sum_trigger);
input start,reset,clk;
input [1:0] layer;
output reg [31:0] RAM_address;
output reg [2:0] unit_sel,unit_address;
output reg write, sum_trigger;

reg [2:0] state, nextstate, count, unitcount;

always @ (posedge clk) begin
	state <= nextstate;
	if(reset==1)
		state <= 0;
end

always @ (state or start) begin
	case(state)
		0: begin
			RAM_address <= 0;
			unit_sel <= 0;
			unit_address <= 0;
			write <= 0;
			sum_trigger <= 0;
			count <= 0;
			unitcount <= 0;
			if(start==1)
				nextstate <= 1;
			else
				nextstate <= 0;
			end
		1: begin
			RAM_address <= RAM_address;
			unit_sel <= unit_sel;
			unit_address <= unit_address;
			write <= 1;
			sum_trigger <= 0;
			count <= count + 1;
			unitcount <= unitcount;
			nextstate <= 2;
			end
		2: begin
			RAM_address <= RAM_address + 1;
			unit_sel <= unit_sel;
			unit_address <= unit_address + 1;
			write <= 0;
			sum_trigger <= 0;
			count <= count;
			unitcount <= unitcount;
			if(count == 4) nextstate <= 4;
			else nextstate <= 3;
			end
		3: begin //stall one cycle for ram latency
			RAM_address <= RAM_address;
			unit_sel <= unit_sel;
			unit_address <= unit_address;
			write <= 0;
			sum_trigger <= 0;
			count <= count;
			unitcount <= unitcount;
			nextstate <= 1;
			end
		4: begin //update unit while stalling for ram latency
			RAM_address <= RAM_address;
			unit_sel <= unit_sel + 1;
			unit_address <= 0;
			write <= 0;
			sum_trigger <= 0;
			count <= 0;
			unitcount <= unitcount + 1;
			nextstate <= 5;
			end
		5: begin //check unit count
			RAM_address <= RAM_address;
			unit_sel <= unit_sel;
			unit_address <= unit_address;
			write <= 0;
			sum_trigger <= 0;
			count <= count;
			unitcount <= unitcount;
			if(unitcount == 4) nextstate <= 6;
			else nextstate <= 1;
			end
		6: begin
			RAM_address <= RAM_address;
			unit_sel <= unit_sel;
			unit_address <= unit_address;
			write <= 0;
			sum_trigger <= 1;
			count <= count;
			unitcount <= unitcount;
			nextstate <= 7;
			end
		7: begin
			RAM_address <= RAM_address;
			unit_sel <= unit_sel;
			unit_address <= unit_address;
			write <= 0;
			sum_trigger <= 0;
			count <= count;
			unitcount <= unitcount;
			nextstate <= 0;
			end
		endcase
	end
endmodule
