module separateur_valeur(value, unit, diz);
	input[6:0] value;
	
	output[0:3] unit;
	output[0:3] diz;
	
	reg[0:3] var_unit;
	reg[0:3] var_diz;

	always @(value)
	begin
		var_unit = value % 10;
		var_diz = (value - var_unit) / 10;
	end
	
	assign unit = var_unit;
	assign diz = var_diz;
	
endmodule
