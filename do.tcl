vsim -gui work.mips_cpu_tb
add wave -position insertpoint  \
sim:/mips_cpu_tb/cpu_uut/clk \
sim:/mips_cpu_tb/cpu_uut/reset \
sim:/mips_cpu_tb/cpu_uut/instruction \
sim:/mips_cpu_tb/cpu_uut/alu_op \
sim:/mips_cpu_tb/cpu_uut/pc \
sim:/mips_cpu_tb/cpu_uut/pc_from_mux \
sim:/mips_cpu_tb/cpu_uut/pc_next