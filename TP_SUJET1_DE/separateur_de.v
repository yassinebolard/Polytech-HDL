module separateur_de(dice, unit, diz, cent, d);
	input[2:0] dice;
	
	output[0:3] unit;
	wire[0:3] unit;
	output[0:3] diz;
	wire[0:3] diz;
	output[0:3] cent;
	wire[0:3] cent;
	output[0:3] d;
	wire[0:3] d;
	
	reg[0:3] var_unit;
	reg[0:3] var_diz;
	reg[0:3] var_cent;
	reg[0:3] var_d;
	
	localparam[2:0] D4   = 3'd0;
	localparam[2:0] D6   = 3'd1;
	localparam[2:0] D8   = 3'd2;
	localparam[2:0] D10  = 3'd3;
	localparam[2:0] D12  = 3'd4;
	localparam[2:0] D20  = 3'd5;
	localparam[2:0] D30  = 3'd6;
	localparam[2:0] D100 = 3'd7;
	
	always @(dice)
	begin
		var_cent = 15;
		var_d = 15;
		if(dice == D4) begin
			var_unit = 4;
			var_diz = 14;
		end else if (dice == D6) begin
			var_unit = 6;
			var_diz = 14;
		end else if (dice == D8) begin
			var_unit = 8;
			var_diz = 14;
		end else if (dice == D10) begin
			var_unit = 0;
			var_diz = 1;
			var_cent = 14;
		end else if (dice == D12) begin
			var_unit = 2;
			var_diz = 1;
			var_cent = 14;
		end else if (dice == D20) begin
			var_unit = 0;
			var_diz = 2;
			var_cent = 14;
		end else if (dice == D30) begin
			var_unit = 0;
			var_diz = 3;
			var_cent = 14;
		end else if (dice == D100) begin
			var_unit = 0;
			var_diz = 0;
			var_cent = 1;
			var_d = 15;
		end
	end
	
	assign unit = var_unit;
	assign diz = var_diz;
	assign cent = var_cent;
	assign d = var_d;

endmodule
