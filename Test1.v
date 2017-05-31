module Test1(on,w,C,clk50M,clk1k,hs1,A1,b,LED1);
	input on, w, clk50M, clk1k;
	input [23:0]C;
	output reg b;
	output reg A1;
	output reg [9:0] LED1;
	output [23:0]hs1;
	//Declare all inputs and outputs.
	
	wire A;
	wire [11:0]r;
	//Declare all wires and registers.
	
	LFSR12 L1(clk50M,r[11:0]);
	DownCounter DC1(r[11:0],~w,clk1k,A);
	HighScore H1(b,C[23:0],hs1[23:0]);
	//Generate all Test1 modules.
	
	always@(posedge w, negedge on) begin
		if (~on)
			b <= 1'b0;
		else
			b <= b ^ 1'b1;
	end
	//Enable and disable for the button input.
	
	always@(posedge clk50M) begin
		if (on) begin
			A1 = b & A;
			LED1[9] = b & A;
			LED1[8] = b & A;
			LED1[7] = b & A;
			LED1[6] = b & A;
			LED1[5] = b & A;
			LED1[4] = b & A;
			LED1[3] = b & A;
			LED1[2] = b & A;
			LED1[1] = b & A;
			LED1[0] = b & A;
		end
		else begin
			A1 = 1'b0;
			LED1[9:0] = 10'b0000000000;
		end
	end
	//Enable and disable for the outputs.
	
endmodule 