module incrementation_continue(dice, clk, random);
	input[2:0] dice;
	input clk;
	
	output[0:6] random;
	wire[0:6] random;
	
	reg[0:6] valeur = 0;
	reg start_range;
	reg[0:6] end_range;
	
	localparam[2:0] D4   = 3'd0;
	localparam[2:0] D6   = 3'd1;
	localparam[2:0] D8   = 3'd2;
	localparam[2:0] D10  = 3'd3;
	localparam[2:0] D12  = 3'd4;
	localparam[2:0] D20  = 3'd5;
	localparam[2:0] D30  = 3'd6;
	localparam[2:0] D100 = 3'd7;
	
	always @(posedge clk)
	begin
		if(dice == D4) begin
			start_range = 1;
			end_range = 7'd4;
		end 
		else if (dice == D6) begin
			start_range = 1;
			end_range = 7'd6;
		end 
		else if (dice == D8) begin
			start_range = 1;
			end_range = 7'd8;
		end 
		else if (dice == D10) begin
			start_range = 0;
			end_range = 7'd9;
		end 
		else if (dice == D12) begin
			start_range = 1;
			end_range = 7'd12;
		end 
		else if (dice == D20) begin
			start_range = 1;
			end_range = 7'd20;
		end 
		else if (dice == D30) begin
			start_range = 1;
			end_range = 7'd30;
		end 
		else if (dice == D100) begin
			start_range = 0;
			end_range = 7'd99;
		end
		
		valeur = ((valeur + 1) % (end_range + 1)) + start_range;
		
	end
	
	assign random = valeur;		
	
endmodule
