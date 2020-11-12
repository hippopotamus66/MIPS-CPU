module alu_control_block (func, alu_op, alu_ctrl);
input [4:0] func; //this is the last (smallest) five bits from the 32 bit instruction
input [2:0] alu_op; //from control block
output [3:0] alu_ctrl; // to alu


wire notfunc, out1, notalu, out2, notalu1;

or_gate or1(.x(func[0]), .y(func[3]), .z(out1));
and_gate and1(.x(out1), .y(alu_op[1]), .z(alu_ctrl[0]));

not_gate not1(.x(func[2]), .z(notfunc));
not_gate not2(.x(alu_op[1]), .z(notalu));
or_gate or2(.x(notfunc), .y(notalu), .z(out1));
and_gate and2(.x(out1), .y(alu_op[1]), .z(alu_ctrl[1]));

and_gate and3(.x(func[1]), .y(alu_op[1]), .z(out2));
or_gate or3(.x(out2), .y(alu_op[0]), .z(alu_ctrl[2]));

not_gate not3(.x(alu_op[0]), .z(notalu1));
and_gate and4(.x(notalu1), .y(alu_op[0]), .z(alu_ctrl[3]));

endmodule