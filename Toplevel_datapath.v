
module Toplevel_datapath_4bits (
  input [3:0] dados,
  input [2:0] operacao, //**
  input sel21_mux, // Sinal de controle para o mux 2x1
  input sel12_demux, // Sinal de controle para o demux 1x2
  input [1:0]addr, // ****
  input clk, 
  input rst, 
  output  [3:0] result,// Resultado de 4 bits da operação realizada pela ULA.
  output carry_out // indicando se houve um carry gerado ou um borrow na operação aritmética
  );
  
  wire [3:0] in_data1,demux_in,reg4_0, reg4_1,fio_a,fio_b,res;
  
  mux2x1 u0(
		.sel(sel21_mux),
		.in0(dados),
		.in1(res),
		.out (in_data1)
		);  

  register_file u1(
		.data_in(in_data1), //saida do mux pro registrador
		.addr(addr), 
		.we(escrita),
		.clk(clk),
		.data_out (demux_in)
		);  
		
	demux_1x4 u2(
		.in(demux_in), //saida do
		.sel(sel12_demux),
		.out0(reg4_0),
		.out1(reg4_1)
		);  
		

	registrador_4bits u3(
		.d(reg4_0),         //entrada do demux para o o reg4
		.reset(rst),
		.clk(clk),
		.q ( fio_a)      //saida pra Ula, entrada A
		);  

   registrador_4bits u4(
		.d(reg4_1),         //entrada do demux para o o reg4
		.reset(rst),
		.clk(clk),
		.q( fio_b)      //saida pra Ula, entrada B
		);  
	
		
	ula u5 (
		.A(fio_a),
		.B(fio_b),
		.seletor(operacao),
		.carry_in (carry_in),
		.resultado(res),
		.carry_out (carry_out),
		.gerado(gerado),
		.propagado(propagado)
		);  
  
  assign result = res;  
  
  endmodule
  