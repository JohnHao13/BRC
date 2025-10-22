module BRC
(
	input logic [31:0] i_rs1_data,
	input logic [31:0] i_rs2_data,
	input logic i_br_un,
	output logic o_br_less,
	output logic o_br_equal
);


	logic Less_un, Less_si;
	
Comp32_32 inst1
(
	.A(i_rs1_data),
	.B(i_rs2_data),
	.Less(Less_un),
	.Equal(o_br_equal)
);

Comp32_32 inst2
(
	.A({1'b0, i_rs1_data[30:0]}),
	.B({1'b0, i_rs2_data[30:0]}),
	.Less(Less_si),
	.Equal()
);

	always_comb begin
		if(i_br_un) begin
			o_br_less = ~ (o_br_equal) & ((i_rs1_data[31] & ~ i_rs2_data[31]) | (~i_rs1_data[31] & ~i_rs2_data[31] & Less_si) | (i_rs1_data[31] & i_rs2_data[31] & Less_si)); 
		end
		else begin
			o_br_less = Less_un;
		end
	end
	
endmodule