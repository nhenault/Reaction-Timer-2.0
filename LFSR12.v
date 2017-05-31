module LFSR12(clk50M,r);
	input clk50M;
	output reg [11:0]r;
	//Declare input and output.
	
	initial
		r = 12'b010010101101;
	//initialize r to a non-zero value.
	
	always@(posedge clk50M) begin
		if (r == 12'b000000000000)
			r[11:0] <= 12'b010010101101;
		//Failsafe: if r hits 0, set it
		//to a non-zero value.
		
		else begin
			r[11] <= r[10];
			r[10] <= r[9];
			r[9] <= r[8];
			r[8] <= r[7];
			r[7] <= r[6];
			r[6] <= r[5];
			r[5] <= r[4];
			r[4] <= r[3];
			r[3] <= r[2];
			r[2] <= r[1];
			r[1] <= r[0];
			r[0] <= r[6] ^ r[7];
			//Shift the bits to the left and
			//make the LSB the XOR of bits 0
			//and 1.
		end
	end
	
endmodule 