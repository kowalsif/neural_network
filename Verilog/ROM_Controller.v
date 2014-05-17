`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/14/2014 04:37:43 PM
// Design Name: 
// Module Name: ROM_Controller
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


module ROM_Controller(
    input start,
    input clk,
    input reset,
    output [0:31] rom_output,
    output reg start_network_controller
    );
    parameter rom_addr = 32'h0000000f;
    reg [1:0] state;
    reg [1:0] nextstate;
    
    always @ (posedge clk)begin
        if(reset == 1)begin state <=0; nextstate <=0; end
        else state<=nextstate;
    end
    
    always @ (posedge start or state) begin
        case(state)
            2'b00: begin
                    start_network_controller <=0;
                    if(start == 1)
                        nextstate <= 2'b01;
                    else
                        nextstate<=2'b00;
                end
            2'b01: begin
                    //wait for ram information to propagate
                    start_network_controller <=0;
                    nextstate<=2'b10;
                end
            2'b10: begin
                //wait for start to go back to 0
                    if(start == 1)
                        nextstate<=2'b10;
                    else
                        nextstate<=2'b00;
                     start_network_controller <=1;
                end
             default: begin
                    nextstate<=2'b00;
                    start_network_controller <=0;
             end
         endcase
    end
    //----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
    blk_mem_gen_0 blk_rom (
      .clka(clk),    // input wire clka
      .rsta(reset),    // input wire rsta
      .ena(1'b1),      // input wire ena
      .addra(rom_addr),  // input wire [31 : 0] addra
      .douta(rom_output)  // output wire [31 : 0] douta
    );
    // INST_TAG_END ------ End INSTANTIATION Template ---------
endmodule
