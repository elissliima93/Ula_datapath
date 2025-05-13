
module register_file(

   input [3:0]data_in, //Entrada de dados de 4 bits que será armazenada no registrador.
   //input reset, //Quando está em nível alto (1), o registrador é resetado para 4'b0000.
   input clk, 
   input [1:0]addr, //Endereço de 2 bits que seleciona um dos 4 registros
   input we, //Write Enable
   output reg [3:0] data_out // A saída de 4 bits, que armazena o valor atual do registrador.
 
  );
  reg [3:0] R0,R1,R2,R3;
	
  always @(posedge clk) begin
	  
	 if(we) 
	  case (addr)
		2'b00: R0 = data_in;
		2'b01: R1 = data_in;
		2'b10: R2 = data_in;
		2'b11: R3 = data_in;
		endcase
	else 
		case (addr)
		2'b00: data_out = R0;
		2'b01: data_out = R1;
		2'b10: data_out = R2;
		2'b11: data_out = R3;
		endcase
	end
endmodule
