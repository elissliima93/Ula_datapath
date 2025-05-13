 
 
 module mux2x1 (
  input sel, // sinal de seleção de 1 bit
  input [3:0] in0, // Entrada 0
  input [3:0] in1, // Entrada 1
  output [3:0] out

  );
  // Se sel for igual a 1, a saída será igual a in1. Caso contrário,a saída será igual a in0.
  
  assign out = (sel) ? in1 : in0;
 
  endmodule
  
  