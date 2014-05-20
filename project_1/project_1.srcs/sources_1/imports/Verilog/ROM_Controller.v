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
    output reg [0:31] rom_output,
	output reg [1:0] address,
	output reg writeData,
    output reg start_network_controller
    );
//    parameter rom_addr = 32'h00000003;
	reg [4:0] rom_addr;
    reg [1:0] state=0;
    reg [1:0] nextstate=0;
    reg [3:0] currentUnit;
    wire [31:0] rom_data;
    wire debouncedStart;
    wire oneShotStart;
    
    DebouncerWithoutLatch debounce(start, debouncedStart, reset, clk);
    ClockedOneShot oneShot(debouncedStart, oneShotStart, reset, clk);
    
    always @ (posedge clk)begin
        if(reset == 1)begin state <=0; end
        else state<=nextstate;
    end
    
    
    always @ (oneShotStart or state) begin
        case(state)
            0: begin
					rom_addr<=1;
					address<=0;
					writeData<=0;
					start_network_controller <=0;
					currentUnit <=0;
					rom_output <= rom_data;
					
                    if(oneShotStart == 1)
                        nextstate <= 1;
                    else
                        nextstate<=0;
                end
            1: begin
                    //send write signal to data reg
                    rom_addr<=rom_addr;
					address<=address;
					writeData<=1;
					start_network_controller <=0;
					currentUnit <=currentUnit;
					rom_output <= rom_output;
					
                    nextstate<=2;
                end
			2: begin
					//Allow time for the ram to propagate
					rom_addr<= rom_addr +1;
					address<=address+1;
					writeData<=0;
					start_network_controller <=0;
					currentUnit <=currentUnit +1;
					rom_output <= rom_output;
					
					nextstate<=3;
				end
            3: begin
                //wait for start to go back to 0
                    if(currentUnit !=4) begin
                        nextstate<=1;
						start_network_controller <=0;
						rom_output <= 0;
					end
                    else begin
                        nextstate<=0;
						start_network_controller <=1;
						rom_output <= rom_output;
					end
					rom_addr<= rom_addr;
					address<=address;
					writeData<=0;
                end
             default: begin
                    nextstate<=2'b00;
                    start_network_controller <=0;
					rom_addr<=rom_addr;
					address<=address;
					writeData<=1;
					currentUnit <=0;
					rom_output <= 0;
             end
         endcase
    end
    //----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
    rom_blk blk_rom (
      .clka(clk),    // input wire clka
      .ena(1'b1),      // input wire ena
      .addra(rom_addr),  // input wire [31 : 0] addra
      .douta(rom_data)  // output wire [31 : 0] douta
    );
    // INST_TAG_END ------ End INSTANTIATION Template ---------
endmodule
