module control_mechanism(opcode,alu_op, jump,reg_dst,mem_to_reg,branch,mem_read,mem_write,alu_src,reg_write);  

input[5:0] opcode;  //bits 26:31 of instruction  
reg notop0, notop1, notop2, notop3, notop4, notop5, r_format, lw, sw, beq;
output jump, reg_dst,mem_to_reg,branch,mem_read,mem_write,alu_src,reg_write;
output [1:0] alu_op;

not_gate not1(.x(opcode[0]), .z(notop0));
not_gate not2(.x(opcode[1]), .z(notop1));
not_gate not3(.x(opcode[2]), .z(notop2));
not_gate not4(.x(opcode[3]), .z(notop3));
not_gate not5(.x(opcode[4]), .z(notop4));
not_gate not6(.x(opcode[5]), .z(notop5));

nand_gate_6 nand1(.a(notop0), .b(notop1), .c(notop2), .d(notop3), .x(notop4), .y(notop5), .z(r_format));
nand_gate_6 nand2(.a(opcode[0]), .b(opcode[1]), .c(notop2), .d(notop3), .x(notop4), .y(opcode[5]), .z(lw));
nand_gate_6 nand3(.a(opcode[0]), .b(opcode[1]), .c(notop2), .d(opcode[3]), .x(notop4), .y(opcode[5]), .z(sw));
nand_gate_6 nand4(.a(notop0), .b(notop1), .c(opcode[2]), .d(notop3), .x(notop4), .y(notop5), .z(beq));
nand_gate_6 nand5(.a(notop0), .b(opcode[1]), .c(notop2), .d(notop3), .x(notop4), .y(notop5), .z(jump)); //only a jump when opcode equals 2


assign reg_dst = r_format;
assign mem_to_reg = lw;
assign mem_read = lw;
assign mem_write = sw;
assign branch = beq;
assign alu_op = {r_format, beq};

or_gate or1 (.x(lw), .y(sw), .z(alu_src));
or_gate or2 (.x(r_format), .y(lw), .z(reg_write));

   
endmodule  