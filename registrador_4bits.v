
module registrador_4bits(

   input [3:0]d, //Entrada de dados de 4 bits que ser� armazenada no registrador.
   input reset, //Quando est� em n�vel alto (1), o registrador � resetado para 4'b0000.
   input clk, 
   output reg [3:0]q // A sa�da de 4 bits, que armazena o valor atual do registrador.
 
  );
  // Register file storage
  //reg [3:0] registers;
  
  always @(posedge clk or posedge reset) begin
	  
	  if (reset)
		  //registers = 4'b0000;
		  q = 4'b0000;
	else 
		q =d ;
		    end
endmodule
 