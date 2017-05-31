module StateMachineR(sw,clk1k,r);
	input sw, clk1k;
	output reg r;
	//Declare inputs and output.
	
	reg s[1:0];
	//Declare the state registers.
	
	always@(posedge clk1k) begin
		s[1] <= s[0] & sw;
		s[0] <= sw;
		r    <= ~s[1] & s[0];
	end
	//Set the values of the state
	//registers and output.
	
endmodule 