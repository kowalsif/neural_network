`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: RAMReadDriver
// Project Name: Neural Network
// Description: For 4 units
// 
//////////////////////////////////////////////////////////////////////////////////

module RAM_Read_Driver(start,layer,reset,clk,RAM_address,unit_sel,unit_address,write,sum_trigger);
input start,reset,clk;
input [1:0] layer;
output reg [9:0] RAM_address;
output reg [1:0] unit_sel,unit_address; //TODO: Python
output reg write, sum_trigger;

reg [3:0] state, nextstate;
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
		1: begin //stall one cycle for ram latency
			nextstate <= 2;
			end
		2: begin //stall two cycles for ram latency
			nextstate <= 3;
			end
		3: begin
			nextstate <= 4;
			end
		4: begin
			nextstate <= 5;
			end
		5: begin //stall one cycle for ram latency
			if(count ==4) nextstate <= 7; //TODO: Python
			else nextstate <= 6;
			end
		6: begin //stall second cycle for ram latency
			nextstate <= 3;
			end
		7: begin //update unit while stalling for ram latency
			nextstate <= 8;
			end
		8: begin //check unit count
			if(unitcount == 4) nextstate <= 9; //TODO: Python
			else nextstate <= 3;
			end
		9: begin
			nextstate <= 10;
			end
		10: begin
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
		1: begin //stall one cycle for ram latency
			RAM_address <= RAM_address;
			unit_sel <= unit_sel;
			unit_address <= unit_address;
			write <= 0;
			sum_trigger <= 0;
			count <= count;
			unitcount <= unitcount;
			end
		2: begin //stall two cycles for ram latency
			RAM_address <= RAM_address;
			unit_sel <= unit_sel;
			unit_address <= unit_address;
			write <= 0;
			sum_trigger <= 0;
			count <= count;
			unitcount <= unitcount;
			end
		3: begin
			RAM_address <= RAM_address;
			unit_sel <= unit_sel;
			unit_address <= unit_address;
			write <= 1;
			sum_trigger <= 0;
			count <= count + 1;
			unitcount <= unitcount;
			end
		4: begin
			RAM_address <= RAM_address + 1;
			unit_sel <= unit_sel;
			unit_address <= unit_address + 1;
			write <= 0;
			sum_trigger <= 0;
			count <= count;
			unitcount <= unitcount;
			end
		5: begin //stall one cycle for ram latency
			RAM_address <= RAM_address;
			unit_sel <= unit_sel;
			unit_address <= unit_address;
			write <= 0;
			sum_trigger <= 0;
			count <= count;
			unitcount <= unitcount;
			end
		6: begin //stall two cycles for ram latency
			RAM_address <= RAM_address;
			unit_sel <= unit_sel;
			unit_address <= unit_address;
			write <= 0;
			sum_trigger <= 0;
			count <= count;
			unitcount <= unitcount;
			end
		7: begin //update unit while stalling for ram latency
			RAM_address <= RAM_address;
			unit_sel <= unit_sel + 1;
			unit_address <= 0;
			write <= 0;
			sum_trigger <= 0;
			count <= 0;
			unitcount <= unitcount + 1;
			end
		8: begin //check unit count
			RAM_address <= RAM_address;
			unit_sel <= unit_sel;
			unit_address <= unit_address;
			write <= 0;
			sum_trigger <= 0;
			count <= count;
			unitcount <= unitcount;
			end
		9: begin
			RAM_address <= RAM_address;
			unit_sel <= unit_sel;
			unit_address <= unit_address;
			write <= 0;
			sum_trigger <= 1;
			count <= count;
			unitcount <= unitcount;
			end
		10: begin
			RAM_address <= RAM_address;
			unit_sel <= unit_sel;
			unit_address <= unit_address;
			write <= 0;
			sum_trigger <= 0; //what? was one, should check
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
