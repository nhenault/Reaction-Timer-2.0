module clk_div(clk50M,clk1k);
	input clk50M;
	output reg clk1k;
	//Declare input and output.
	
	reg [14:0]count;
	//Declare counting integer.
	
	always@(posedge clk50M) begin
		count <= count + 1'b1;
		if (count == 25000) begin
			clk1k <= clk1k ^ 1'b1;
			count <= 1'b0;
		end
		//Alternate the output clock
		//every 25000 cycles.
	end

endmodule 