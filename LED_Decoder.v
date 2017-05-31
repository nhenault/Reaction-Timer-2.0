module LED_Decoder(c,d,read,clk50M,LED2);
	input [3:0]c;
	input [3:0]d;
	input read, clk50M;
	output reg [9:0]LED2;
	//Declare inputs and output.
	
	initial
		LED2[9:0] = 10'b0000000000;
	//Begin with all LEDs off.
	
	always@(posedge clk50M) begin
		if (read) begin
			if (LED2[7:0] == 8'b00000000) begin
				LED2[3:0] <= c[3:0];
				LED2[7:4] <= d[3:0];
				LED2[9:8] <= 2'b00;
			end
			//If the activation signal is on
			//and the LEDs are off, turn on
			//the LEDs based on the inupts.
			
			else
				LED2[9:0] <= LED2[9:0];
			//If the activation signal is on
			//and the LEDs are on, keep the
			//LEDs as they are.
		end
		
		else
			LED2[9:0] <= 10'b0000000000;
		//If the activation signal is off
		//turn off all LEDs.
	end
	
endmodule 