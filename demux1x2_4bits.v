 
 
 module demux_1x4(

  input [3:0]in, // Entrada de dados
   input sel, //Sinal de seleção de 1 bit
   output reg [3:0] out0 ,
   output reg [3:0] out1
  );
 
  always @(*) begin
 
	//saida[0] = 0; saida[1] = 0; saida[2] = 0; saida[3] = 0;
	//if (en)begin
		case (sel)
			1'b0: out0 = in; // 
			1'b1: out1 = in; //
			
			
		endcase
		end 
		
  endmodule
  
 
 