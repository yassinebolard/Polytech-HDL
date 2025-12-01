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
	
	wire clean_inc;
   wire clean_dec;
	wire[0:2] dice;
	wire[0:3] w_unit;
	wire[0:3] w_diz;
	wire[0:3] w_cent;
	wire[0:3] w_d;

	
	// Nettoie le bouton Droit (Incrément)
    button_shaper db_inc (
        .clk(Clk),
        .reset_n(1'b1), // On peut mettre 1 si on n'a pas de reset global
        .button_in(R_Btn),
        .pulse_out(clean_inc) // Sort une impulsion propre
    );

    // Nettoie le bouton Gauche (Décrément)
    button_shaper db_dec (
        .clk(Clk),
        .reset_n(1'b1),
        .button_in(L_Btn),
        .pulse_out(clean_dec) // Sort une impulsion propre
    );
	 
	
	// Module pour la sélection de dé
	select_dice selecteur(
        .Clk(Clk),
        .Reset_n(1'b1),    // Ou connecte un Switch
        .inc(clean_inc), 
        .dec(clean_dec), 
        .dice(dice)
    );
	
	// Module pour le séparateur du dé selectionné
	separateur_de valeur_de(
		.dice(dice),
		.unit(w_unit),
		.diz(w_diz),
		.cent(w_cent),
		.d(w_d)
	);
	
	// Module pour les afficheurs 7s
	afficheur7s affichage_d_unit(
		.In(w_unit),
		.Out(d_unit)
	);	
	
	afficheur7s affichage_d_diz(
		.In(w_diz),
		.Out(d_diz)
	);	
	
	afficheur7s affichage_d_cent(
		.In(w_cent),
		.Out(d_cent)
	);	
	
	afficheur7s affichage_d_d(
		.In(w_d),
		.Out(d_d)
	);	
	
endmodule
