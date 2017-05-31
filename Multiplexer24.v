module Multiplexer24(a,b,s,f);
	input [23:0]a;
	input [23:0]b;
	input s;
	output reg [23:0]f;
	//Declare inputs and output.
	
	always@(a, b, s)
		case(s)
			0 : f[23:0] <= a[23:0];
			1 : f[23:0] <= b[23:0];
		endcase
	//Assign values based on the switch.
	
endmodule 