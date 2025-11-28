module afficheur7s(In, Out);
	input[3:0] In;
	output[0:6] Out;
	reg[0:6] int_Out;
	
	parameter COMMON_ANODE = 1; // Doit être soit égal à 0 (Common Cathode) ou 1 (Common Anode)
	
	assign Out = COMMON_ANODE ? ~int_Out : int_Out;
	
	always @(In)
	begin
		case(In)
			0: int_Out<=7'b1111110;
			1: int_Out<=7'b0110000;
			2: int_Out<=7'b1101101;
			3: int_Out<=7'b1111001;
			4: int_Out<=7'b0110011;
			5: int_Out<=7'b1011011;
			6: int_Out<=7'b1011111;
			7: int_Out<=7'b1110010;
			8: int_Out<=7'b1111111;
			9: int_Out<=7'b1111011;
			10: int_Out<=7'b1110111;
			11: int_Out<=7'b0011111;
			12: int_Out<=7'b1001110;
			13: int_Out<=7'b0111101;
			14: int_Out<=7'b1001111;
			15: int_Out<=7'b0000000;
		endcase
	end
endmodule
