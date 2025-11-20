module afficheur_de(de_value, HEX0, HEX1, HEX2, HEX3);
	input[2:0] de_value;
	output[0:6] HEX0;
	output[0:6] HEX1;
	output[0:6] HEX2;
	output[0:6] HEX3;
	
	localparam D4   = 0;
	localparam D6   = 1;
	localparam D8   = 2;
	localparam D10  = 3;
	localparam D12  = 4;
	localparam D20  = 5;
	localparam D30  = 6;
	localparam D100 = 7;
	
	reg [3:0] digit0_val;
   reg [3:0] digit1_val;
   reg [3:0] digit2_val;
   reg [3:0] digit3_val;
	
	// Instance pour HEX0 (Unités)
   afficheur7s hex0_inst(
        .E(digit0_val), 
        .S(HEX0),
        // .COMMON_ANODE(1) // Décommentez si vous avez besoin d'inverser le signal
    );

    // Instance pour HEX1 (Dizaines)
   afficheur7s hex1_inst(
        .E(digit1_val), 
        .S(HEX1)
    );

    // Instance pour HEX2 (Centaines ou Lettre 'd')
   afficheur7s hex2_inst(
        .E(digit2_val), 
        .S(HEX2)
    );

    // Instance pour HEX3 (Milliers ou éteint)
   afficheur7s hex3_inst(
        .E(digit3_val), 
        .S(HEX3)
    );

   always @(de_value)
   begin
        // Valeurs par défaut pour reset
        digit0_val = 6;
        digit1_val = 13; 
        digit2_val = 15;
		  digit3_val = 15;
    end

endmodule
