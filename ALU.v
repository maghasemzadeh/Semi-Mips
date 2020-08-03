//YA ROGHAY-YEH

module ALU (A, B, opcode, result, Zero);
    input signed [31:0] A;
    input signed [31:0] B;
    input [5:0] opcode;
    output reg [31:0] result;
    output wire Zero;

	always@(*)	begin
		case (opcode)
			1, 18:  result = A + B;
			2, 19:  result = A - B;
			3, 20:  result = A * B;
			4, 21:  result = A / B;
			5:  result = A % B;
			6:  result = (A > B) ? A : B;
			7:  result = (A < B) ? A : B;
			8:  result = ~A;
			9, 22:  result = ~(A & B);
			10, 23:  result = A ~^ B;
			11:  result = A << B;
			12:  result = A >> B;
			13:  result = (A << B) | (A >> 32 - B);
			14:  result = (A >> B) | (A << 32 - B);
			15, 63:  result = ($unsigned(A) < $unsigned(B)) ? 1 : 0;
			default:  result = 0;
		endcase
	end
	
	assign Zero = ~(|result);

endmodule
