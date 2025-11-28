module selection_valeur(random, select, value);
	input[6:0] random;
	input select;
	
	output[0:6] value;
	
	reg[6:0] memorized;
	
	always @(posedge select)
	begin
		memorized = random;
	end
	
	assign value = memorized;

endmodule
