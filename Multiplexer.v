module Multiplexer(a,b,s,f);
	input [3:0]a;
	input [3:0]b;
	input s;
	output reg [3:0]f;
	//Declare inputs and output.
	
	always@(a, b, s)
		case(s)
			0 : f[3:0] <= a[3:0];
			1 : f[3:0] <= b[3:0];
		endcase
	//Assign values based on the switch.
	
endmodule 