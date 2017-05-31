module ShiftReg(clk,c);
	input clk;
	output reg [3:0]c;
	//Declare input and output.
	
	initial
		c = 4'b0001;
	//Initialize the register with
	//one 1.
	
	always@(posedge clk) begin
			c[3] <= c[2];
			c[2] <= c[1];
			c[1] <= c[0];
			c[0] <= c[3];
	//Continually shift the one
	//in a circle.
	end
	
	
endmodule 