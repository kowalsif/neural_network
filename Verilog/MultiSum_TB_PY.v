`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: MultiSum Test Fixture
// Project Name: Brain Network
// Description:  
// 
//////////////////////////////////////////////////////////////////////////////////

module MultiSum_TB();
reg [31:0] in0, in1, in2, in3;
reg start, clk;
wire [31:0] sum;
wire done;

reg [5:0] count = 0;

MultiSum UUT(in0, in1, in2, in3, start, clk, sum, done);

initial begin
	clk=0;
	in0=0; in1=0; in2=0; in3=0; start=0; #5;
	start=1; #2;
	start=0;
end

always @ (posedge done) begin
	if(count==3) begin #5; $stop; end
	in0=count*1+1; in1=count*2+1; in2=count*3+1; in3=count*4+1; start=0; #5;
	start=1; #2;
	start=0;
	count=count+1;
end

always #1 clk = ~clk;

endmodule
