`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2014 05:59:35 PM
// Design Name: 
// Module Name: Network_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Network_tb;
reg start, reset,clk;
wire done, out;

reg [2:0] count;
//module Network(start, reset, clk, done, out);
Network UUT(.start(start),.reset(reset),.clk(clk),.done(done),.out(out));

initial begin
    start = 0; reset = 1; clk = 0; count = 3'b000; #30;
    reset = 0; #10;
    start = 1;
end

always @ (posedge done) begin
    if(count==2) begin #50; $finish; end
    else begin count = count + 1; end
end
    
 always #1 clk = ~clk;
endmodule
