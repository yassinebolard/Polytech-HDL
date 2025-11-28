module select_dice(Clk, increment, decrement, dice);
	parameter[2:0] DEFAULT_DICE = 3'd0;

	input increment;
	input Clk;
	input decrement;
	
	output[0:2] dice;
	wire[0:2] dice;
	
	reg[2:0] current_dice = DEFAULT_DICE;
	
	always @(posedge Clk)
	begin
		if (increment) current_dice = (current_dice + 1) % 8;
		else if (decrement) current_dice = (current_dice - 1) % 8;
	end
	
	assign dice = current_dice;

endmodule
