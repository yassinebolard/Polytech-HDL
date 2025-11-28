module lfsr8(Clk, rst, rnd);

	input Clk;
	input rst; // remise à zéro
	output[7:0] rnd; // valeur aléatoire
	
	wire Clk;
	wire rst;
	reg[7:0] rnd;
	
	
   wire feedback;
	
   // Exemple de taps pour un LFSR de 8 bits: bit7 ⊕ bit5 ⊕ bit4 ⊕ bit3  
   assign feedback = rnd[7] ^ rnd[5] ^ rnd[4] ^ rnd[3];

   always @(posedge Clk or posedge rst) begin
       if (rst) begin
           rnd <= 8'hA5; // valeur quelconque non-nulle
       end else begin
           rnd <= { rnd[6:0], feedback };
       end
   end
endmodule
