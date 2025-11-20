module add8b(A,B,Clk,S);

input Clk;

input A[7:0];
input B[7:0];

output S[8:0];
reg[8:0] S;


always @(negedge(Clk))
begin
	S <= a + b;
end


endmodule
