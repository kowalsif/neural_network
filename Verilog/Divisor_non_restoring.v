`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2014 07:36:10 PM
// Design Name: 
// Module Name: Divisor_non_restoring
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


module Divisor_non_restoring(
    input [31:0] Top,
    input [31:0] Divisor,
    input CLOCK,
    input START,
    input reset,
    output reg [31:0] Quotient,
    output reg Finish
    );
   
reg [31:0] remainder; 
reg [15:0] remainderh;
reg [16:0] remainderl;
reg [6:0] state;
reg [6:0] nextstate;
reg [31:0] divisor;
reg rev; //tell us whether or not to set it negative. 
wire test = remainderh[15];

//TODO: Add reset

always@(posedge CLOCK)
    begin
    if (reset == 1) state <= 0;
    else state <= nextstate;
    end
    
always@(state or START)
    begin
    case(state)
    0: begin
        if (START == 1)
            nextstate <= 1;
        else 
            nextstate <= 0; 
        end
    1: begin
        nextstate <= 2;
       end
    2: begin
        nextstate <= 3;
       end
    3: begin
        nextstate <= 4;
       end
    4: begin
        nextstate <=5;
       end   
    5: begin
        nextstate <= 6;
       end
    6: begin
        nextstate <= 7;
       end
    7: begin
        nextstate <= 8;
       end
    8: begin
        nextstate <=9;
       end 
    9: begin
        nextstate <= 10;
       end
    10: begin
        nextstate <= 11;
       end
    11: begin
        nextstate <= 12;
      end
    12: begin
        nextstate <=13;
      end 
    13: begin
        nextstate <= 14;
      end
    14: begin
       nextstate <= 15;
      end
    15: begin
       nextstate <= 16;
      end
    16: begin
       nextstate <= 17;
      end
    17: begin
       if (START == 1)
            nextstate <= 0;
       else nextstate <=16;
      end    
   default: nextstate <= 0;
   endcase
   end

always@ (posedge CLOCK)
    begin
    if (state == 0)
        begin
        Finish <= 0;
        Quotient <= 0;
        end
    else if (state == 1)
        begin
        Finish <= 0;
        Quotient <= 0;
        if (Top[31]==1) //load the values 
            remainder <= (~Top[31:0]) + 1'b1;
        else 
            remainder <= Top; 
        if (Divisor[15]==1)
            divisor <= (~Divisor[31:0])+1'b1;
        else 
            divisor <= Divisor;
        end
    else if (state == 2)
        begin
        remainderh <= remainder[31:16];
        remainderl <= remainder[15:0];
        end //get them in registers 
    else if (state <= 17)
        begin
            if ((((remainderh[15:0]<<1)+remainderl[15])-divisor[15:0]) < 16'b1000000000000000 )// 1'b1) //greater than zero
                begin
                    Quotient <= (Quotient<<1)+1'b1;
                    remainderh[15:0] <= (remainderh<<1+remainderl[15])-divisor[15:0];
                    remainderl <= (remainderl<<1);
                end
            else 
                begin
                    remainderh[15:0] <= (remainderh<<1)+remainderl[15];
                    remainderl <= remainderl<<1;
                    Quotient <= Quotient<<1;
                end
        end
    if (state == 17)
        begin
        Finish <= 1;
        Quotient <= Quotient;
        end
    end

endmodule