module mips_cpu (clk, reset);

input clk, reset;
wire [31:0] from_sign_extend, read_data_1, read_data_2, to_alu, alu_result, data, write_data, from_shift_mux, from_adder_pc, adder_result; 
wire [31:0] instruction;
wire [1:0] alu_op;
wire jump,reg_dst,mem_to_reg,branch,mem_read,mem_write,alu_src,reg_write;
wire zero_from_alu, from_nand, cs_flag;
wire [3:0] alu_control_sig;
wire[4:0] reg_dst_num;
wire [31:0] pc, pc_from_mux;

reg [31:0] pc_next, data_addr;

//should initialize instruction and data memory
//initial begin
	//pc_next = 32'h00400020;
///end 
assign pc = pc_next;	


sram instr_mem(.cs(1'b1),.oe(1'b1),.we(1'b0),.addr(pc),.din(),.dout(instruction)); //cs: low = memory selected || oe: low = read data outputted || we: high = allowed to write

syncram data_mem(.clk(clk), .cs(1'b1),.oe(mem_read),.we(mem_write),.addr(data_addr),.din(read_data_2),.dout(data)); // control signal write enable 

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
						  
						  				
mux_32 mux_after_data_mem (.sel(mem_to_reg), //should be 1 initially
							      .src0(alu_result), 
									.src1(data), 
									.z(write_data));

									
sll_32bit shift_2 (.x(from_sign_extend),
					 .shift(32'b00000000000000000000000000000010), //shfting left by 2
					 .z(from_shift_mux));

					 
adder_32 adder_pc(.a(pc), 
						.b(32'd4), //adding 4 
						.z(from_adder_pc));					 
					 
					 
adder_32 adder_after_shift(.a(from_adder_pc), 
									.b(from_shift_mux), 
									.z(adder_result));
									

and_gate gate1(.x(branch), 
					 .y(zero_from_alu),
					 .z(from_nand));
					 
					 
mux_32 mux_after_adder (.sel(from_nand), 
							.src0(from_adder_pc), 
							.src1(adder_result), 
							.z(pc_from_mux));

always @(posedge clk)
    begin
    	if (reset == 0) begin
    		pc_next <= 32'h00400020;
		//data_addr <= 32'h10000000;
	end	
    	else
    	begin
		pc_next <= pc_from_mux;
		//data_addr <= alu_result;		
    	end	
    end
always @(negedge clk)
    begin
    	if (reset == 0) begin
    		
		data_addr <= 32'h10000000;
	end	
    	else
    	begin
		
		data_addr <= alu_result;		
    	end	
    end

//mux_32 mux_pc (.sel(reset), 
//			.src0(32'h00400020), 
//			.src1(pc_from_mux), 
//			.z(pc_next));

				
endmodule
							