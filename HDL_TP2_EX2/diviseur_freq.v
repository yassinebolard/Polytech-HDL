module diviseur_freq(clkIn, clkOut);
	parameter
		BUS_SIZE = 24,
		NBT = 10,
		NBTON = 5,
		POLARITE = 0;
	
	input clkIn;
	output clkOut;
	reg clkOut;
	
	reg[(BUS_SIZE-1):0] Nb = 0;
	
	always @(negedge clkIn)
		begin
			if (Nb >= NBT-1) 
				Nb <= 0;
			else
				Nb <= Nb + 1;
				
			if (Nb >= NBTON)
				clkOut <= POLARITE;
			else
				clkOut <= ~POLARITE;
		end

endmodule

				