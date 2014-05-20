`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2014 05:34:02 PM
// Design Name: 
// Module Name: Denominator
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


module Denominator(
    input [31:0] X,
    input CLOCK,
    input start,
    input reset,
    output reg startout,
    output reg [31:0] denom
    );
    
reg [1:0] state, nextstate;
    
always @(posedge CLOCK) begin
    if (reset == 1) state <=0;
    else state <=nextstate;
end

always @(state or X)begin
    case (state)
        0: begin
            if(start ==0)
                nextstate<=0;
            else if (start == 1&& X[31] ==1)
                nextstate<=1;
            else
                nextstate<=2;
        end
        1: begin
            nextstate<=3;
        end
        2: begin
            nextstate<=3;
        end
        3: begin
            nextstate<=0;
        end
        default: begin
             nextstate<=0;
        end
    endcase
end
    
always@(posedge CLOCK)begin
    case(state)
        0: begin
            denom<=0;
            startout<=0;
        end
        1: begin
           denom<=denom <= (~X)+2'b10;
           startout<=0;
        end
        2: begin
            denom <= X + 1'b1;
            startout<=0;
        end
        3: begin
            denom <= denom;
            startout<=1;
        end
        default: begin
            denom <=0;
            startout <=0;
        end
    endcase
end   
    
endmodule
