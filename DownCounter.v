module DownCounter(c,start,clk1k,A);
	input [11:0]c;
	input start, clk1k;
	output reg A;
	//Declare all inputs and output.
	
	reg [11:0]count;
	//Declare the counter register.
	
	initial
		A = 0;
	//Initialize A to be off.
	
	always@(posedge clk1k, posedge start) begin
		if (start) begin
			count[11:0] <= c[11:0];
			A <= 1'b0;
		end
		//When the button is pressed,
		//set the down count value to
		//the inputed value.
		
		else begin
			if (count == 12'b000000000000)
				A <= 1'b1;
			//If the counter is done counting
			//down, output a 1.
			
			else begin
				count <= count - 1'b1;
				A <= 1'b0;
			end
			//If the counter is not done counting
			//down, output a 0 and decrement the
			//count register by 1.
		end
	end
	
endmodule 