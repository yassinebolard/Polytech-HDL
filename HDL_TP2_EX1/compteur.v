// Module compteur 4 bits
module compteur(Clk, Q);
	parameter 
		BUS_SIZE = 4, // Pas mettre 0
		MODULO = 5, // Pas mettre 0 et vérifier que le modulo permet est compris entre [1; 2^BUS_SIZE]
		CLKEDGE = 1, // 1 = Pos, 0 = Neg
		UPDOWN = 1; // 0 = Down, 1 = Up
	input Clk;
	
	output[(BUS_SIZE-1):0] Q;
	reg[(BUS_SIZE-1):0] Q;
	
	wire clk_edge = CLKEDGE ? Clk : !Clk;
	
	always @(posedge clk_edge)
		begin
			if (!UPDOWN && !Q) begin
				Q <= MODULO - 1;
			end
			Q <= (Q+(UPDOWN ? 1 : -1))%MODULO;
		end

endmodule
