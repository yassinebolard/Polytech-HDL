module change_value(increment, selected_dice, new_dice);
	input increment;
	input[2:0] selected_dice;
	output[0:2] new_dice;
	reg[0:2] int_new_dice;
	
	parameter MAX = 7;
	
	always @(increment or selected_dice)
	begin
		// Incrémentation ou décrémentation modulo (MAX+1)
		if (increment)
			int_new_dice <= (selected_dice + 1) % (MAX + 1);
		else
			int_new_dice <= (selected_dice - 1) % (MAX + 1);
	end
	
	assign new_dice = int_new_dice;
	
endmodule
