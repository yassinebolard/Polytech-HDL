module afficheur7s(E, S);
	input[3:0] E;
	output[0:6] S;
	reg[0:6] int_S;
	
	parameter common_anode = 1;
	
	assign S = common_anode ? ~int_S : int_S;
	
	always @(E)
	begin
		case(E)
			0: int_S<=7'b1111110;
			1: int_S<=7'b0110000;
			2: int_S<=7'b1101101;
			3: int_S<=7'b1111001;
			4: int_S<=7'b0110011;
			5: int_S<=7'b1011011;
			6: int_S<=7'b1011111;
			7: int_S<=7'b1110010;
			8: int_S<=7'b1111111;
			9: int_S<=7'b1111011;
			10: int_S<=7'b1110111;
			11: int_S<=7'b0011111;
			12: int_S<=7'b1001110;
			13: int_S<=7'b0111101;
			14: int_S<=7'b1001111;
			15: int_S<=7'b1000111;
		endcase
	end
endmodule
