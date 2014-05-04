`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2014 08:18:24 PM
// Design Name: 
// Module Name: LayerMux
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


module LayerMux(
    input [31:0] summed_input,
    input [31:0] elliot_input,
    input summed_finished,
    input elliot_finished,
    input sel,
    output reg [31:0] y,
    output reg done
    );
    
    always @ (sel or summed_input or summed_finished or elliot_input or elliot_finished) begin
        case(sel)
        1'b0: begin
            y<=summed_input;
            done<=summed_finished;
        end
        1'b1: begin 
            y<=elliot_input;
            done<=elliot_finished;
        end
        default: begin 
            y<=summed_input;
            done<=summed_finished;
        end
        endcase
    end
    
endmodule
