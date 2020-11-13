module pc(clk, reset, en, pc_next, pc, en_inst_mem);

input clk;
input reset;
input en;
input [31:0] pc_next;

output reg [31:0] pc;
output reg en_inst_mem;
reg [31:0] ii;

initial begin
ii <= 0;
pc <= 32'h00400020;
en_inst_mem <= 1'b1; //was 0
end
always @(posedge clk)
    begin
    	if (reset == 0) begin
    		pc <= 32'h00400020;	
	end	
    	else
    		if (ii < 2) begin
		ii <= ii + 1;
	 	end else begin
		if (en == 1'b1) begin //enable like sleep flag
		en_inst_mem <= 1;
		pc <= pc_next;  
		ii <= 0;
		end
	end
    end
endmodule