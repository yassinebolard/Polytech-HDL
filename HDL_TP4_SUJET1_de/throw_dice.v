module throw_dice(Clk, rst_button, dice, new_value);
	input Clk;
	input rst_button;
	input[2:0] dice;
	output[0:7] new_value;
	reg[0:7] new_value;
	wire[0:7] rnd_value;
	
	localparam D4   = 0;
	localparam D6   = 1;
	localparam D8   = 2;
	localparam D10  = 3;
	localparam D12  = 4;
	localparam D20  = 5;
	localparam D30  = 6;
	localparam D100 = 7;
	
	// Instance du générateur pseudo-aléatoire (LFSR 8 bits)
	lfsr8 rnd_int(
		.Clk(Clk),
		.rst(rst_button),
		.rnd(rnd_value)
	);
	
	// Bloc combinatoire qui détermine la valeur selon le type de dé
	always @(dice or rnd_value)
	begin
		case(dice)
			D4:   new_value <= (rnd_value % 4) + 1;
			D6:   new_value <= (rnd_value % 6) + 1;
			D8:   new_value <= (rnd_value % 8) + 1;
			D10:  new_value <= (rnd_value % 10);
			D12:  new_value <= (rnd_value % 12) + 1;
			D20:  new_value <= (rnd_value % 20) + 1;
			D30:  new_value <= (rnd_value % 30) + 1;
			D100: new_value <= (rnd_value % 100);
		endcase
	end
endmodule
