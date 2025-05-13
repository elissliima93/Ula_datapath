//ULA descrição comportamental
  
 module ula (
  input [3:0] A,// Operando A
  input [3:0] B, // Operando B
  input [2:0] seletor, // Sinal de seleção (3 bits)
  input carry_in,
  output reg [3:0] resultado, // Resultado da operação
  output carry_out, 
  output gerado, 
  output propagado 
  );
  
   wire [3:0] soma;
   wire G,P;

	always @(*) begin 
		
		case (seletor)
		3'b000: resultado = A & B;  // Operação AND 
		3'b001: resultado = A | B; // Operação OR
		3'b010: resultado = ~A;  // Operação NOT
		3'b011: resultado = ~(A & B);  // Operação NAND
		3'b100:resultado = soma;
		3'b101: resultado = A- B;
		default: resultado = 4'b0000;   // Operação padrão
		
			endcase
		end
		
	behave_4bit_carry_lookahead_adder somador(
		.A(A), 
		.B(B), 
		.Cin(carry_in),
		.Sum(soma), 
		.Cout(carry_out),
		.gerador(G),
		.propagador(P)
		
		);  
		 
		assign gerado =G;
		assign propagado =P;
  endmodule
  