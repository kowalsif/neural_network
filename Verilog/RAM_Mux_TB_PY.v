`timescale 1ns / 1ps
module RAM_Mux_TB();
reg [31:0] ram_out;
reg [3:0] unit_sel;
reg write;
reg CLOCK;
wire [31:0] weight0; wire write0;
wire [31:0] weight1; wire write1;
wire [31:0] weight2; wire write2;
wire [31:0] weight3; wire write3;
wire [31:0] weight4; wire write4;
wire [31:0] weight5; wire write5;


RAMMux_py UUT(ram_out,unit_sel,write,CLOCK,weight0,write0,weight1,write1,weight2,write2,weight3,write3,weight4,write4,weight5,write5);

initial begin
	CLOCK=0; write=0;ram_out=1; unit_sel=0; #5
	unit_sel=0; write=1; ram_out=1;#5;
	write=0; #5;
	unit_sel=1; write=1; ram_out=2;#5;
	write=0; #5;
	unit_sel=2; write=1; ram_out=4;#5;
	write=0; #5;
	unit_sel=3; write=1; ram_out=8;#5;
	write=0; #5;
	unit_sel=4; write=1; ram_out=16;#5;
	write=0; #5;
	unit_sel=5; write=1; ram_out=32;#5;
	write=0; #5;
end
always #1 CLOCK = ~CLOCK;

endmodule