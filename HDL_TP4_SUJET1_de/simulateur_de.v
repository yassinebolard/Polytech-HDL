module simulateur_de(Clk, KEY0, KEY1, KEY2, HEX0, HEX1, HEX2, HEX3, HEX6, HEX7);
	parameter DEFAULT_DICE = 0;
	
	input Clk;
	input KEY0;
	input KEY1;
	input KEY2;
	
	output[0:6] HEX0;
	output[0:6] HEX1;
	output[0:6] HEX2;
	output[0:6] HEX3;
	output[0:6] HEX6;
	output[0:6] HEX7;
	
	reg[2:0] selected_dice;
	wire[2:0] new_dice_inc;
	wire[2:0] new_dice_dec;
	wire[7:0] new_value;
	reg[7:0] value;
	
	// Valeur initiale du dé sélectionné
	initial
	begin
		selected_dice = DEFAULT_DICE;
	end
	
	// Module pour l’incrémentation (KEY0)
	change_value inc_module(
		.increment(1),
		.selected_dice(selected_dice),
		.new_dice(new_dice_inc)
	);
	
	// Module pour la décrémentation (KEY2)
	change_value dec_module(
		.increment(0),
		.selected_dice(selected_dice),
		.new_dice(new_dice_dec)
	);
	
	// Module pour lancer le dé (KEY1)
	throw_dice pulled_value(
		.Clk(Clk),
		.rst_button(KEY1),
		.dice(selected_dice),
		.new_value(new_value)
	);
	

	
	always @(posedge KEY0 or posedge KEY2)
	begin
		if (KEY0) // Incrémentation sur front montant de KEY0
			selected_dice <= new_dice_inc;
		else if (KEY2) // Décrémentation sur front montant de KEY2
			selected_dice <= new_dice_dec;
	end
	
	always @(posedge KEY1)
	begin
		value <= new_value;
	end
		
	// Module pour afficher le dé sélectionné
	afficheur_de affichage_selection (
        .de_value(selected_dice), 
        .HEX0(HEX0),
        .HEX1(HEX1),
        .HEX2(HEX2),
        .HEX3(HEX3)
    );
	
endmodule
