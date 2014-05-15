`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2014 05:53:04 PM
// Design Name: 
// Module Name: ram_access
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


module ram_access(
    input [9:0] addra,
    input CLOCK,
    input write,
    input [31:0] data,
    output [31:0] dataout
    );
    
    
    RAM your_instance_name (
      .clka(CLOCK),    // input wire clka
      .ena(1'b1),      // input wire ena
      .wea(write),      // input wire [0 : 0] wea
      .addra(addra),  // input wire [9 : 0] addra
      .dina(data),    // input wire [31 : 0] dina
      .douta(dataout)  // output wire [31 : 0] douta
    );
    
    
endmodule
