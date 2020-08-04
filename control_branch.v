module control_branch(branch_opcode, zero, branch, ctrl);
	input [1:0] branch_opcode;
	input branch;
	input zero;
	output [1:0] ctrl;
	reg [1:0] ctrl;
	
	always @(*)
	begin
		if (branch == 0)
			ctrl = 2'b00;
		else
		begin
			case(branch_opcode)
				0:	ctrl = 2'b10;
				1:	ctrl = 2'b11;
				2, 3:	ctrl = zero == 1? 2'b01: 2'b00;
							
			endcase
		
		end
		
	end

endmodule
