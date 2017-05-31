module StateMachine(w,clk,Match,Z);
	input w, clk, Match;
	output reg Z;
	//Declare inputs and outputs.
	
	reg a, b;
	//Declare the two registers
	
	initial
		Z = 0;
	//initialize Z to 0.
	
	always@(posedge clk) begin
		a = w & ~Z;
		b = ~Match & Z;
		Z = a | b;
	end
	//Assign values based on the
	//state machine designed to
	//control Z based on the inputs.
	
endmodule 