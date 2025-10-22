module Comp2_2
(
	input logic Equ,
	input logic [1:0] A,
	input logic [1:0] B,
	output logic Less,
	output logic Equal
);
	logic eq, le;
	assign eq = (~(A[1] ^ B[1])) & (~(A[0] ^ B[0]));
	assign le = (~A[1] & B[1]) | (B[1] & ~A[0] & B[0]) | (~A[1] & ~A[0] & B[0]); 
	
	assign Equal = eq & Equ;
	assign Less = le & Equ;
	
endmodule