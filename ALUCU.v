module ALUCU(ALUOp, func, ALUCtr);
    
    input [1:0] ALUOp;
    input [5:0] func;
    output reg [3:0] ALUCtr;

//wire and_op, or_op, slt_signed_op, full_adder_signed_op, sll_op, sub_op, slt_u_op, fa_u_op; 
//
//assign and_op = 4'b0000;
//assign or_op = 4'b0001;
//assign slt_signed_op = 4'b0011;
//assign full_adder_signed_op = 4'b0010;
//assign sll_op = 4'b0101;
//assign sub_op = 4'b0110;
//assign slt_u_op = 4'b0111;
//assign fa_u_op = 4'b0100;
   
always @(*) begin
	if (func == 6'b100100) begin 
		 ALUCtr = 4'b0000; 
	end else if (func == 6'b100101) begin
		 ALUCtr = 4'b0001; 
	end else if (func == 6'b100000) begin
		 ALUCtr = 4'b0010; 
	end else if (func == 6'b101010) begin
		 ALUCtr = 4'b0011;
	end else if ((func == 6'b100001) || (ALUOp == 2'b00)) begin
		 ALUCtr = 4'b0100;
	end else if (func == 6'b000000) begin
		 ALUCtr = 4'b0101;
	end else if ((func == 6'b100010) || (func == 6'b100011) || (ALUOp == 2'b01)) begin
		 ALUCtr = 4'b0110;
	end else if (func == 6'b101011) begin
		 ALUCtr =  4'b0111;
	end 
	end


//	if (ALUOp[0] == 1'b1) begin ALUCtr = branch;
//	end else begin
//	ALUCtr = load_store;
//	end
//end
//end
 
endmodule
	
    


//
//
//    wire [2:0] ALUCtr_temp;
//    wire [2:0] ALUCtr_sll;
//    wire [2:0] ALUCtr_adu;
//    wire [2:0] ALUCtemp;
//    wire [2:0] ALUCtremp;
//    wire Ffunc;
//    wire self;
//    
//
//    assign Ffunc = (func[5] || func[4] || func[3] || func[2] || func[1] || func[0] || (~ALUOp[2]));
//    
//    assign ALUCtr_sll = 3'b101;
//    
//    assign self = (func[5] && (~func[4]) && (~func[3]) && (~func[2]) && (~func[1]) && func[0] && ALUOp[2]);
//    
//    assign ALUCtr_adu = 3'b010;
//    
//    
//    assign ALUCtr_temp[2] = (((~ALUOp[2]) && ALUOp[0]) || (ALUOp[2] && (~func[2]) && func[1] && (~func[0])));
//    assign ALUCtr_temp[1] = (((~ALUOp[2]) && (~(ALUOp[1] && ALUOp[0]))) | (ALUOp[2] && (~func[2]) & (~func[0]))); 
//    assign ALUCtr_temp[0] = ((ALUOp[2] && (~func[3]) && func[2] && (~func[1]) && func[0]) || (ALUOp[2] && func[3] && (~func[2]) && func[1] && (~func[0])));
//    
//    mux_n #(.n(3)) mux_map_0(.sel(Ffunc), .src0(ALUCtr_sll), .src1(ALUCtr_temp), .z(ALUCtremp));
//    mux_n #(.n(3)) mux_map_1(.sel(self), .src0(ALUCtremp), .src1(ALUCtr_adu), .z(ALUCtr));
//    
//endmodule
//    
    
    
