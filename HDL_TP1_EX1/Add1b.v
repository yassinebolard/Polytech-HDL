module Add1b(A,B,S,Co);

input A;
input B;

output S;
output Co;

// Gate Level
// xor Toto(S,A,B);
// and Titi(Co,A,B);

// Dataflow
assign S = A ^ B;
assign Co = A & B;


endmodule
