module SSDecoder(c,ss);
	input [3:0]c;
	output reg [6:0]ss;
	//Declare input and output.
	
	always@(c)
		case(c)
			4'b0000 : ss[6:0] = 7'b1000000;
			4'b0001 : ss[6:0] = 7'b1111001;
			4'b0010 : ss[6:0] = 7'b0100100;
			4'b0011 : ss[6:0] = 7'b0110000;
			4'b0100 : ss[6:0] = 7'b0011001;
			4'b0101 : ss[6:0] = 7'b0010010;
			4'b0110 : ss[6:0] = 7'b0000010;
			4'b0111 : ss[6:0] = 7'b1111000;
			4'b1000 : ss[6:0] = 7'b0000000;
			4'b1001 : ss[6:0] = 7'b0010000;
			default : ss[6:0] = 7'b1000000;
		endcase
	//Cases for 0-9, default to 0.
	
endmodule 