module afficheur4s(E, S);
	input E;
	output[0:3] S;
	reg[0:3] S;
	initial begin 
		S <= 4'b0000;
	end
	always @(negedge E)
	begin
			S <= S+1;
	end
endmodule
