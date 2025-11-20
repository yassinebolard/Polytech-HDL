module chrono7s(Clk, Msb, Lsb);
	input Clk;
	
	output Msb[0:6];
	output Lsb[0:6];
	
	parameter
		NBT = 50000000, // 50Mhz Clock inside
		NBTON = 50000000, // idem
		BUS_SIZE = 8,
		MODULO = 256,
		A_C = 1;
		
	wire Clkint;
	wire Nb[7:0];
	
	diviseur_freq #(19, 50000000, 25000000, 1) divby500k(Clk, Clkint);
	compteur #(8, 256, 1, 1) cnt8bits_modulo256(Clkint, Nb);
	
	afficheur7s #(1) afficheurMsb(Nb[7:4], Msb);
	afficheur7s #(1) afficheurLsb(Nb[3:0], Lsb);
	
endmodule
