
module behave_4bit_carry_lookahead_adder (
 input [3:0] A, //! Operando A (4 bits)
 input [3:0] B, //! Operando B (4 bits)
 input Cin,//! Carry de entrada
 output reg [3:0] Sum, //! Resultado da soma (4 bits)
 output reg Cout,
 output reg gerador,
 output reg propagador
 
  );
 
  // Registradores internos para propaga��o e gera��o
  reg [3:0] P; //! Propaga��o
  reg [3:0] G; //! Gera��o
  reg [3:0] C; //! Carries internos
 //! Carry de sa�da
 

 
 // Bloco procedural que calcula a soma
  always @(*) begin
 
 // L�gica de propaga��o e gera��o
 P = A ^ B;  // Propaga��o: P[i] = A[i] XOR B[i]
 G = A & B;  // Gera��o: G[i] = A[i] AND B[i]
 
 // L�gica de Carry Look-Ahead
	C[0] = Cin;
 //carry vem do carry de entrada
	C[1] = G[0] | (P[0] & C[0]);
 //Carry para o bit 1
 C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]); //
 //Carry para o bit 2
 C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) |
 (P[2] & P[1] & P[0] & C[0]); // Carry para o bit 3
 
 // Carry de sa�da
 Cout = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) |
	(P[3] & P[2] & P[1] & G[0]) |
	(P[3] & P[2] & P[1] & P[0] & C[0]);
 // Soma final
		Sum = P ^ C;
		gerador = G[3];
		propagador = P[3];
		
  end
 
 endmodule
