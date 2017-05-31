module Counter(reset,A,clk,clko,o);
	input reset, A, clk;
	output reg clko;
	output reg [3:0]o;
	//Declare inputs and outputs.
	
	always@(posedge clk, posedge reset) begin
		if(reset)
			o <= 4'b0000;
		//If the user resets the clock,
		//set the output to 0.
		
		else if (A) begin
			if (o == 4'b0100)
				clko <= 1'b0;
			if (o == 4'b1001) begin
				clko <= 1'b1;
				o <= 1'b0000;
			end
			else
				o <= o + 1'b1;
		end
		//When activated, count and
		//output a clock at 1/10 speed.
		
		else
			o = o;
		//When not activated, continue to
		//display the current value.
	end

endmodule 