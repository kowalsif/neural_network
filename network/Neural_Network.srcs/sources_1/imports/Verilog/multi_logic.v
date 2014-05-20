`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2014 11:15:22 AM
// Design Name: 
// Module Name: multi_logic
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


module multi_logic(
    input [31:0] xin0,
    input [31:0] xin1,
    input CLOCK,
    input activate,
    output reg done,
    output reg [31:0] res,
    output reg error //signal error with multiply if detectable
    );
   
reg sign;
reg  [63:0] temp0 = 64'b0000000000000000000000000000000000000000000000000000000000000000;
reg  [31:0] temp1 = 31'b00000000000000000000000000000000;
reg  [31:0] temp2;
reg  [31:0] temp3;
reg  [5:0] state = 5'b0000000;

  
always@(posedge CLOCK)
    begin 
    case(state)
    0:  begin
            done <= 0;
            sign = xin0[31]^xin1[31];
            temp1 <= 31'b00000000000000000000000000000000;
            temp0[0] <= xin0[0] & xin1[0];
            temp0[1] <= xin0[0] & xin1[1];
            temp0[2] <= xin0[0] & xin1[2];
            temp0[3] <= xin0[0] & xin1[3];
            temp0[4] <= xin0[0] & xin1[4];
            temp0[5] <= xin0[0] & xin1[5];
            temp0[6] <= xin0[0] & xin1[6];
            temp0[7] <= xin0[0] & xin1[7];
            temp0[8] <= xin0[0] & xin1[8];
            temp0[9] <= xin0[0] & xin1[9];
            temp0[10] <= xin0[0] & xin1[10];
            temp0[11] <= xin0[0] & xin1[11];
            temp0[12] <= xin0[0] & xin1[12];
            temp0[13] <= xin0[0] & xin1[13];
            temp0[14] <= xin0[0] & xin1[14];
            temp0[15] <= xin0[0] & xin1[15];
            temp0[16] <= xin0[0] & xin1[16];
            temp0[17] <= xin0[0] & xin1[17];
            temp0[18] <= xin0[0] & xin1[18];
            temp0[19] <= xin0[0] & xin1[19];
            temp0[20] <= xin0[0] & xin1[20];
            temp0[21] <= xin0[0] & xin1[21];
            temp0[22] <= xin0[0] & xin1[22];
            temp0[23] <= xin0[0] & xin1[23];
            temp0[24] <= xin0[0] & xin1[24];
            temp0[25] <= xin0[0] & xin1[25];
            temp0[26] <= xin0[0] & xin1[26];
            temp0[27] <= xin0[0] & xin1[27];
            temp0[28] <= xin0[0] & xin1[28];
            temp0[29] <= xin0[0] & xin1[29];
            temp0[30] <= xin0[0] & xin1[30];
            temp0[31] <= xin0[0] & xin1[31];
        end
    32: begin
            res <= temp1-temp0;
            done <= 1;
            if (temp1[31]^temp0[31] != sign)
                error <= 1;
            else 
                error <= 0;
        end
    33: begin
            res <= res;
            error <= error;
            done <= 1;
        end
    default: begin
                temp1 <= temp1+temp0;
                temp0[0+state] <= xin0[state] & xin1[0];
                temp0[1+state] <= xin0[state] & xin1[1];
                temp0[2+state] <= xin0[state] & xin1[2];
                temp0[3+state] <= xin0[state] & xin1[3];
                temp0[4+state] <= xin0[state] & xin1[4];
                temp0[5+state] <= xin0[state] & xin1[5];
                temp0[6+state] <= xin0[state] & xin1[6];
                temp0[7+state] <= xin0[state] & xin1[7];
                temp0[8+state] <= xin0[state] & xin1[8];
                temp0[9+state] <= xin0[state] & xin1[9];
                temp0[10+state] <= xin0[state] & xin1[10];
                temp0[11+state] <= xin0[state] & xin1[11];
                temp0[12+state] <= xin0[state] & xin1[12];
                temp0[13+state] <= xin0[state] & xin1[13];
                temp0[14+state] <= xin0[state] & xin1[14];
                temp0[15+state] <= xin0[state] & xin1[15];
                temp0[16+state] <= xin0[state] & xin1[16];
                temp0[17+state] <= xin0[state] & xin1[17];
                temp0[18+state] <= xin0[state] & xin1[18];
                temp0[19+state] <= xin0[state] & xin1[19];
                temp0[20+state] <= xin0[state] & xin1[20];
                temp0[21+state] <= xin0[state] & xin1[21];
                temp0[22+state] <= xin0[state] & xin1[22];
                temp0[23+state] <= xin0[state] & xin1[23];
                temp0[24+state] <= xin0[state] & xin1[24];
                temp0[25+state] <= xin0[state] & xin1[25];
                temp0[26+state] <= xin0[state] & xin1[26];
                temp0[27+state] <= xin0[state] & xin1[27];
                temp0[28+state] <= xin0[state] & xin1[28];
                temp0[29+state] <= xin0[state] & xin1[29];
                temp0[30+state] <= xin0[state] & xin1[30];
                temp0[31+state] <= xin0[state] & xin1[31];
        end
    endcase
    end

always@(negedge CLOCK)
    begin
    if (state < 33) 
        state <= state + 1;
    else if (activate == 1)
        state <= 0;
    else state <= state;
    
    end
    
endmodule
