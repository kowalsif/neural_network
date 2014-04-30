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
    output reg [31:0] Quotient,
    output reg Finish
    );
    
reg [31:0] remainder;
reg [6:0] state;
reg [31:0] divisor;
reg rev; //tell us whether or not to set it negative. 

always@(posedge CLOCK)
    begin
    if (state <= 16)
        begin
        remainder[31:16] <=  remainder[31:16] - divisor[15:0]; // have to assume divisor is at most 16bit  
        end
    if (state == 17 || state == 18) 
        Quotient <= Quotient;
    end


always@(negedge CLOCK)
    begin
    if (START == 1)
        begin
        state <= 0;
        Quotient <= 0;
        Finish <= 0;
        rev <= Top[31]^Divisor[15];
        
        if (Top[31]==1)
            remainder <= (~Top[31:0]) + 1'b1;
        else 
            remainder <= Top;
            
        if (Divisor[15]==1)
            divisor <= (~Divisor[31:0])+1'b1;
        else 
            divisor <= Divisor;
        end
    else if (state == 17) //check if inverted
        begin
        if (rev == 1)
            Quotient <= ~Quotient[31:0]+1'b1;
        state = state + 1'b1;
        Finish <= 1;
        end
    else if (state == 18)
        Finish <= 1;
        //Finish <= 1; //hold
    else if  (remainder[31] == 0)
        begin
        Quotient <= (Quotient << 1) + 1'b1;
        state <= state + 1'b1;
        //Quotient[0] <= 1;
        end
    else   
        begin
        remainder[31:16] =  remainder[31:16] + divisor[15:0]; //restore the value
        Quotient <= Quotient << 1; //shift dem bits
        state <= state + 1'b1;
        end
    remainder = remainder << 1;
    end
  
endmodule