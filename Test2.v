module Test2(on,w,C,sw,clk50M,clk1k,hs2,A2,LED2);
	input on, w, clk50M, clk1k;
	input [23:0]C;
	input [7:0]sw;
	output [23:0]hs2;
	output [9:0]LED2;
	output reg A2;
	//Declare all inputs and outputs.
	
	wire match, Z, A;
	wire [7:0]c;
	reg W, Match;
	//Declare all wires and registers.
	
	DownCounter DC2(12'b0010111011100,W,clk1k,A);
	Compare CMP1(clk50M,sw[7:0],LED2[7:0],match);
	StateMachine S1(W,clk50M,Match,Z);
	ShiftReg R1(clk50M,c[3:0]);
	ShiftReg R2(clk1k,c[7:4]);
	LED_Decoder LD1(c[3:0],c[7:4],A2,clk50M,LED2[9:0]);
	HighScore H2(A2,C[23:0],hs2[23:0]);
	//Generate all Test2 modules.
	
	always@(posedge clk50M) begin
		if(on) begin
			W <= w;
			Match <= match;
			if(A) begin
				if(Z)
					A2 = 1'b1;
				else
					A2 = 1'b0;
			end
			else
				A2 = 1'b0;
		end
		
		else begin
			A2 = 1'b0;
			W <= 1'b0;
			Match <= 1'b1;
		end
		//Enable and disable for input and output.	
	end
	
endmodule 