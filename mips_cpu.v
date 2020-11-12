module mips_cpu;


wire [31:0] from_sign_extend, read_data_1, read_data_2, to_alu, alu_result, data, write_data, from_shift_mux, from_adder_pc, adder_result; 
wire [31:0] instruction;
wire [1:0] alu_op;
wire jump,reg_dst,mem_to_reg,branch,mem_read,mem_write,alu_src,reg_write;
wire zero_from_alu, from_nand;
wire [3:0] alu_control_sig;
wire[4:0] reg_dst_num;


//should initialize instruction and data memory

sram instr_mem(.cs(1'b0),.oe(1'b1),.we(1'b0),.addr(pc),.din(),.dout(instruction)); //cs: low = memory selected || oe: low = read data outputted || we: high = allowed to write

sram data_mem(.cs(1'b0),.oe(mem_read),.we(mem_write),.addr(alu_result),.din(read_data_2),.dout(data)); // control signal write enable 

control_mechanism control(.opcode(instruction[31:26]),
								  .alu_op(alu_op), 
								  .jump (jump),
								  .reg_dst (reg_dst),
								  .mem_to_reg (mem_to_reg),
								  .branch (branch),
								  .mem_read (mem_read),
								  .mem_write (mem_write),
								  .alu_src (alu_src),
								  .reg_write(reg_write));
								  
mux_5 mux_for_write_reg (.sel(reg_dst), 
								 .src0(instruction[20:16]), 
								 .src1(instruction[15:11]), 
								 .z(reg_dst_num));//The register destination number for the Write register comes from the rt field (bits 20:16). Otherwise from rd field.
								 
reg_file register(.Ra(instruction[25:21]),
								.Rb(instruction[20:16]), 
								.Rw(reg_dst_num),
								.busW(write_data),
								.busA(read_data_1),
								.busB(read_data_2),
								.RegWr(reg_write),//write_enable
								.clk(clk));
								
extender sign_extend (.x(instruction[15:0]),
										.z(from_sign_extend));
				
mux_32 mux_before_alu (.sel(alu_src), 
							  .src0(read_data_2), 
							  .src1(from_sign_extend), 
							  .z(to_alu));
							  

alu_control_block alu_ctrl (.func(instruction[5:0]), 
								    .alu_op(alu_op), 
									 .alu_ctrl(alu_control_sig));		
			
			
ALU alu_block (.ctrl(alu_control_sig), 
						  .A(read_data_1),
						  .B(to_alu), 
						  .shamt(),
						  .cout(),
						  .ovf(),
						  .ze(zero_from_alu),
						  .R(alu_result));
						  
						  				
mux_32 mux_after_data_mem (.sel(mem_to_reg), 
							      .src0(alu_result), 
									.src1(data), 
									.z(write_data));

									
sll_32bit shift_2 (.x(from_sign_extend),
					 .shift(3'b010), //shfting left by 2
					 .z(from_shift_mux));

					 
adder_32 adder_pc(.a(pc), 
						.b(1'd4), //adding 4 
						.z(from_adder_pc));					 
					 
					 
adder_32 adder_after_shift(.a(from_adder_pc), 
									.b(from_shift_mux), 
									.z(adder_result));
									

nand_gate gate1(.x(branch), 
					 .y(zero_from_alu),
					 .z(from_nand));
					 
					 
mux mux_after_adder (.sel(from_nand), 
							.src0(from_adder_pc), 
							.src1(adder_result), 
							.z(pc));
							
endmodule
							