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
    output [31:0] rom_output,
	output reg [1:0] address,
	output reg writeData,
    output reg start_network_controller
    );
//    parameter rom_addr = 32'h00000003;
	reg [4:0] rom_addr;
    reg [2:0] state=0;
    reg [2:0] nextstate=0;
    reg [3:0] currentUnit;
    wire debouncedStart;
    wire oneShotStart;
    
    DebouncerWithoutLatch debounce(start, debouncedStart, reset, clk);
    ClockedOneShot oneShot(debouncedStart, oneShotStart, reset, clk);
    
    always @ (posedge clk)begin
        if(reset == 1)begin state <=0; end
        else state<=nextstate;
    end
    
    always@(state or oneShotStart or currentUnit) begin
        case(state)
            0: begin
                    if(oneShotStart == 1)
                        nextstate <= 1;
                    else
                        nextstate<=0;   
               end
            1: begin 
                    nextstate<=2;
               end
            2: begin
					nextstate<=3;
			   end
			3: begin
			         nextstate<=4;
			end
			4: begin
			     if(currentUnit != 3)
			         nextstate<=1;
			     else
			         nextstate<=5;
			end
			5: begin 
			     nextstate <=0;
               end
            default: 
                nextstate<=0;
        endcase
    end
    
    always @ (posedge clk) begin 
        case(state)
            0: begin
					rom_addr<=0;
					address<=0;
					writeData<=0;
					start_network_controller <=0;
					currentUnit <=0;
                end
            1: begin
                    //Get rom data
                    rom_addr<=rom_addr;
					address<=address;
					writeData<=0;
					start_network_controller <=0;
					currentUnit <=currentUnit;      
                end
            2: begin
                //wait for RAM
                rom_addr<=rom_addr;
                address<=address;
                writeData<=0;
                start_network_controller <=0;
                currentUnit <=currentUnit;
            end
            3: begin
                //Send write signal
                    rom_addr<=rom_addr;
                	address<=address;
                	writeData<=1;
                	start_network_controller <=0;
                	currentUnit <=currentUnit;                  
            end
			4: begin
					//Allow time for the ram to propagate
					rom_addr<= rom_addr +1;
					address<=address+1;
					writeData<=0;
					start_network_controller <=0;
					currentUnit <=currentUnit +1;
				end
            5: begin
                //wait for start to go back to 0
                    rom_addr<= rom_addr;
                	address<=address;
                	writeData<=0;
                	start_network_controller <=1;
                	currentUnit <=currentUnit;
                end
             default: begin
                    start_network_controller <=0;
					rom_addr<=rom_addr;
					address<=address;
					writeData<=0;
					currentUnit <=0;
             end
         endcase
    end
    //----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
    blk_mem_gen_0 blk_rom (
      .clka(clk),    // input wire clka
      .ena(1'b1),      // input wire ena
      .addra({1'b0,rom_addr}),  // input wire [31 : 0] addra
      .douta(rom_output)  // output wire [31 : 0] douta
    );
    // INST_TAG_END ------ End INSTANTIATION Template ---------
endmodule

