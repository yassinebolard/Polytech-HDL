module lancerde(dice, Throw, Clk, value);
	input[2:0] dice;
	input Throw;
	input Clk;
	
	output[0:6] value;
	
	reg[0:6] random;
	
	// Module pour l'incrementation continue
	incrementation_continue compteur(
		.dice(dice),
		.clk(Clk),
		.random(random)
	);
	
	// Module pour la mémorisation de la valeur
	selection_valeur selecteur(
		.random(random),
		.select(Throw),
		.value(value)
	);
	
endmodule
