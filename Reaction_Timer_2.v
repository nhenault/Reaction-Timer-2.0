module Reaction_Timer_2(key,sw,clk50M,ss,d,led);
	input [1:0]key;
	input [9:0]sw;
	input clk50M;
	output [41:0]ss;
	output d;
	output [9:0]led;
	//Declare all inputs and outputs.
	
	wire clk1k, clk100, clk10, clk1, clk01, clk001, clkn, A1, A2, A, b;
	wire [23:0]hs1;
	wire [23:0]hs2;
	wire [9:0]LED1;
	wire [9:0]LED2;
	wire [23:0]hs;
	wire [23:0]o;
	wire [23:0]C;
	wire R3, R4;
	reg R1, R2, R;
	//Declare all wires and registers.
	
	clk_div U0(clk50M,clk1k);
	Test1 T1(~sw[9],key[0],o[23:0],clk50M,clk1k,hs1[23:0],A1,b,LED1[9:0]);
	Test2 T2(sw[9],~key[1],o[23:0],sw[7:0],clk50M,clk1k,hs2[23:0],A2,LED2[9:0]);
	StateMachineR S2(sw[9],clk1k,R3);
	StateMachineR S3(~sw[9],clk1k,R4);
	Counter C0(R,A,clk1k,clk100,o[3:0]);
	Counter C1(R,A,clk100,clk10,o[7:4]);
	Counter C2(R,A,clk10,clk1,o[11:8]);
	Counter C3(R,A,clk1,clk01,o[15:12]);
	Counter C4(R,A,clk01,clk001,o[19:16]);
	Counter C5(R,A,clk001,clkn,o[23:20]);
	Multiplexer M0(o[3:0],hs[3:0],sw[8],C[3:0]);
	Multiplexer M1(o[7:4],hs[7:4],sw[8],C[7:4]);
	Multiplexer M2(o[11:8],hs[11:8],sw[8],C[11:8]);
	Multiplexer M3(o[15:12],hs[15:12],sw[8],C[15:12]);
	Multiplexer M4(o[19:16],hs[19:16],sw[8],C[19:16]);
	Multiplexer M5(o[23:20],hs[23:20],sw[8],C[23:20]);
	Multiplexer24 M6(hs1[23:0],hs2[23:0],sw[9],hs[23:0]);
	SSDecoder D0(C[3:0],ss[6:0]);
	SSDecoder D1(C[7:4],ss[13:7]);
	SSDecoder D2(C[11:8],ss[20:14]);
	SSDecoder D3(C[15:12],ss[27:21]);
	SSDecoder D4(C[19:16],ss[34:28]);
	SSDecoder D5(C[23:20],ss[41:35]);
	//Generate all top level modules.
	
	assign A = A1 | A2;
	assign led[9] = LED1[9] | LED2[9];
	assign led[8] = LED1[8] | LED2[8];
	assign led[7] = LED1[7] | LED2[7];
	assign led[6] = LED1[6] | LED2[6];
	assign led[5] = LED1[5] | LED2[5];
	assign led[4] = LED1[4] | LED2[4];
	assign led[3] = LED1[3] | LED2[3];
	assign led[2] = LED1[2] | LED2[2];
	assign led[1] = LED1[1] | LED2[1];
	assign led[0] = LED1[0] | LED2[0];

	always@(posedge clk50M) begin
		R1 = ~b & ~key[0] & ~sw[9];
		R2 = ~A2 & ~key[1] & sw[9];
		R = R1 | R2 | R3 | R4;
	end
	
	assign d = 0;
	//Always keep the decimal point on.

endmodule 