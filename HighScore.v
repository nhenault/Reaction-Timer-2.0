module HighScore(b,C,hs);
	input b;
	input [23:0]C;
	output reg [23:0]hs;
	//Declare inputs and outputs.
	
	always@(negedge b) begin
		if (hs == 0 && C != 0)
			hs = C;
		//If there is no stored highscore,
		//place any score except 0.
		
		else begin
			if(C < hs && C != 0)
				hs[23:0] = C[23:0];
			//If the new score is less than the
			//current highscore, make it the new
			//highscore.
		
			else
				hs[23:0] = hs[23:0];
			//Otherwise, the highscore value remains.
		end
	end
	
	
endmodule 