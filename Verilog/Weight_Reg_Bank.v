//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name: WeightRegBank
// Project Name: Brain Network
// Description:  
// 
//////////////////////////////////////////////////////////////////////////////////

module WeightRegBank(dataIn, address, write, clk, out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15, out16, out17, out18, out19, out20, out21, out22, out23, out24, out25, out26, out27, out28, out29);
input [7:0] dataIn;
input [4:0] address;
input write, clk;
output reg [7:0] out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15, out16, out17, out18, out19, out20, out21, out22, out23, out24, out25, out26, out27, out28, out29;

always @ (posedge clk) begin
	if(write == 1) begin
		case(address)
			0: begin
				out0 <= dataIn;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			1: begin
				out0 <= out0;
				out1 <= dataIn;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			2: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= dataIn;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			3: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= dataIn;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			4: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= dataIn;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			5: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= dataIn;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			6: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= dataIn;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			7: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= dataIn;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			8: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= dataIn;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			9: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= dataIn;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			10: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= dataIn;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			11: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= dataIn;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			12: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= dataIn;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			13: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= dataIn;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			14: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= dataIn;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			15: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= dataIn;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			16: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= dataIn;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			17: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= dataIn;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			18: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= dataIn;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			19: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= dataIn;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			20: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= dataIn;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			21: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= dataIn;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			22: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= dataIn;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			23: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= dataIn;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			24: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= dataIn;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			25: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= dataIn;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			26: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= dataIn;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
			27: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= dataIn;
				out28 <= out28;
				out29 <= out29;
				end
			28: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= dataIn;
				out29 <= out29;
				end
			29: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= dataIn;
				end
			default: begin
				out0 <= out0;
				out1 <= out1;
				out2 <= out2;
				out3 <= out3;
				out4 <= out4;
				out5 <= out5;
				out6 <= out6;
				out7 <= out7;
				out8 <= out8;
				out9 <= out9;
				out10 <= out10;
				out11 <= out11;
				out12 <= out12;
				out13 <= out13;
				out14 <= out14;
				out15 <= out15;
				out16 <= out16;
				out17 <= out17;
				out18 <= out18;
				out19 <= out19;
				out20 <= out20;
				out21 <= out21;
				out22 <= out22;
				out23 <= out23;
				out24 <= out24;
				out25 <= out25;
				out26 <= out26;
				out27 <= out27;
				out28 <= out28;
				out29 <= out29;
				end
		endcase
	end
end
endmodule
