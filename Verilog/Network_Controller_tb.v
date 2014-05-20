`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: MultiSum Test Fixture
// Project Name: FPGA Brain
// Description:  
// 
//////////////////////////////////////////////////////////////////////////////////

module Network_Controller_tb();
reg start, done, reset, clk;
wire layer_sel, RAM_Controll_Start;
wire [1:0] layer;

reg flag=1;

Network_Controller UUT(start, done, reset, clk, layer_sel, layer, RAM_Controll_Start);

wire [1:0] state = UUT.state;

initial begin
	clk=0; start=0; done=0; reset=1; #5;
	reset=0; #5;
	start= 1; #2;
	start = 0;
end

always @ (state)begin
	if (state == 0) begin
		if(layer == 0 && flag ==0)
			$finish;
		else
			flag = 0;
	end
end

always @ (posedge RAM_Controll_Start) begin
	#10; done = 1; #2; done = 0;
end

always #1 clk = ~clk;

endmodule
