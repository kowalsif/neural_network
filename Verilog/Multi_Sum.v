`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: MultiSum
// Project Name: FPGA Brain
// Description:  
// 
//////////////////////////////////////////////////////////////////////////////////

module MultiSum(in0, in1, in2, in3, start, clk, reset, sum, done);
input [31:0] in0, in1, in2, in3;
input start, clk, reset;
output reg [31:0] sum;
output reg done;

reg [2:0] state;
reg [2:0] nextstate;


always @ (posedge clk) begin
    if(reset == 1) state <= 0;
    else state<=nextstate;
end

always @ (state or start) begin
	case(state)
	    0: begin
	        if(start == 1) nextstate <=1;
	        else nextstate <=0;
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
		    nextstate <=0;
		end
		default: begin
			nextstate <=0;
		end
	endcase
end

always @ (posedge clk) begin
	case(state)
	    0: begin
	        sum<=0;
	        done<=0;
	    end
		1: begin
			sum <= in0;
			done <= 0;
		end
		2: begin
			sum <= sum + in1;
			done <= 0;
		end
		3: begin
			sum <= sum + in2;
			done <= 0;
		end
		4: begin
			sum <= sum + in3;
			done <= 0;
		end
		5: begin
		    sum <= sum;
		    done <=1;
		end
		default: begin
			sum <= 0;
			done <= 0;
		end
	endcase
end
endmodule
