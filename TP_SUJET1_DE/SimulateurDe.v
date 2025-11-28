module SimulateurDe(Clk, R_Btn, L_Btn, C_Btn, d_unit, d_diz, d_cent, d_d, Aff_Unit, Aff_Diz);
	input Clk;
	input R_Btn;
	input L_Btn;
	input C_Btn;
	
	output[0:6] d_unit;
	output[0:6] d_diz;
	output[0:6] d_cent;
	output[0:6] d_d;
	output[0:6] Aff_Unit;
	output[0:6] Aff_Diz;
	
	wire[0:2] dice;
	wire[0:3] w_unit;
	wire[0:3] w_diz;
	wire[0:3] w_cent;
	wire[0:3] w_d;

	
	// Module pour la sélection de dé
	select_dice selecteur(
		.Clk(Clk),
		.increment(R_Btn),
		.decrement(L_Btn),
		.dice(dice)
	);
	
	// Module pour le séparateur du dé selectionné
	select_dice selecteur(
		.Clk(Clk),
		.increment(R_Btn),
		.decrement(L_Btn),
		.dice(dice)
	);
	
	// Module pour la mémorisation de la valeur
	separateur_de valeur_de(
		.dice(dice),
		.unit(w_unit),
		.diz(w_diz),
		.cent(w_cent),
		.d(w_d)
	);
	
	// Module pour les afficheurs 7s
	
	
endmodule
