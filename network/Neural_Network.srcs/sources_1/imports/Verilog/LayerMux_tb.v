`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2014 04:32:10 PM
// Design Name: 
// Module Name: LayerMux_tb
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


module LayerMux_tb();
    
    reg [31:0] summed_input;
    reg [31:0] elliot_input;
    reg summed_finished;
    reg elliot_finished;
    reg sel;
    
    wire [31:0] y;
    
    LayerMux mux(summed_input, elliot_input, summed_finished, elliot_finished, sel, y);
    
    initial begin
        summed_input = 32'h0000; elliot_input = 32'h000F; summed_finished = 1; elliot_finished = 0; sel=0; #5;
        summed_input = 32'h0000; elliot_input = 32'h000F; summed_finished = 1; elliot_finished = 0; sel=1; #5;
        summed_input = 32'h0000; elliot_input = 32'h000F; summed_finished = 1; elliot_finished = 0; sel=1; #5;
        summed_input = 32'h0000; elliot_input = 32'h000F; summed_finished = 1; elliot_finished = 0; sel=0; #5;
        
        $stop;
    end

endmodule
