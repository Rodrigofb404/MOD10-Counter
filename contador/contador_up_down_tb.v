`timescale 1ns/100ps

module contador_up_down_tb;

	reg clk_tb, reset_tb, seletor_tb;
	wire [3:0] contador_tb;
	
	contador_up_down DUT (.clk(clk_tb), .reset(reset_tb), .seletor(seletor_tb), .contador(contador_tb));
	
	initial begin
		clk_tb = 0;
		reset_tb = 0;
		seletor_tb = 0;
		
		#10 reset_tb = 1;
		
		#9 seletor_tb = 1;
		
		#5 seletor_tb = 0;
	
		#22 reset_tb = 0;
		
		#10 seletor_tb = 1;
		
		#30 seletor_tb = 0;
		
		#12 seletor_tb = 1;
	
		#10 reset_tb = 1;
		
		#42 seletor_tb = 0;
		
		#200 $stop;
	end

	always #1 clk_tb = ~clk_tb;

endmodule