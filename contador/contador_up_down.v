
module contador_up_down (clk, reset, seletor, contador);
	
	input clk, reset, seletor;
	output [3:0] contador;

	reg [3:0] reg_contador;

	assign contador = reg_contador;

	initial reg_contador = 4'b0000;

	always @(posedge clk) begin

	 if (!reset) reg_contador <= 4'b0000; 
	 else begin
	 
		if (seletor) begin // Seletor igual a 1, decremento
		
		  if (reg_contador == 4'b0000) reg_contador <= 4'b1001;
		  else reg_contador <= reg_contador - 4'b0001;
		 
		end else begin // Seletor igual a 0, incremento
		
		  if (reg_contador == 4'b1001) reg_contador <= 4'b0000;
		  else reg_contador <= reg_contador + 4'b0001;
			  
		end
	 end
	end

endmodule