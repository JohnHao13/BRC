module Comp8_8
(
	input logic Equ,
	input logic [7:0] A,
	input logic [7:0] B,
	output logic Less,
	output logic Equal
);

	logic L1, L2, L3, L4;
	logic E1, E2, E3;
	
Comp2_2 inst1 
(
	.Equ(1'b1),
	.A(A[7:6]),
	.B(B[7:6]),
	.Less(L1),
	.Equal(E1)
);

Comp2_2 inst2 
(
	.Equ(E1),
	.A(A[5:4]),
	.B(B[5:4]),
	.Less(L2),
	.Equal(E2)
);

Comp2_2 inst3 
(
	.Equ(E2),
	.A(A[3:2]),
	.B(B[3:2]),
	.Less(L3),
	.Equal(E3)
);

Comp2_2 inst4
(
	.Equ(E3),
	.A(A[1:0]),
	.B(B[1:0]),
	.Less(L4),
	.Equal(Equal)
);

	assign Less = L1 | L2 | L3 | L4;
	
endmodule