module Compare(clk50M,sw,LED2,Match);
	input clk50M;
	input [7:0]sw;
	input [7:0]LED2;
	output reg Match;
	//Declare inputs and output.
	
	always@(posedge clk50M) begin
		if (LED2 == 8'b00000000)
			Match = 1'b0;
		//Don't turn on if there are
		//no LEDs to compare to.
		
		else begin
			if (sw[7:0] == LED2[7:0])
				Match = 1'b1;
			//If the two sets are equal,
			//output a 1 to acknowledge
			//that they match.
			
			else
				Match = 1'b0;
			//If the two sets aren't
			//equal, output a 0.
		end
	end
	
endmodule 