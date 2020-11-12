`timescale 1 ns/10ps
module mips_cpu_tb;

reg clk, reset;

localparam period = 20;

mips_cpu cpu_uut (.clk(clk), .reset(reset));

initial begin
	clk = 0;
	reset = 0;
	#period;
		
	reset = 1;
	#period;
	end
  
always begin    #10 clk = ~clk;    end

endmodule



