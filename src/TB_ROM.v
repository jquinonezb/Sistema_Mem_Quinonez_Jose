
module TB_ROM;

parameter MEMORY_DEPTH = 64;
parameter DATA_WIDTH = 32;
reg [(DATA_WIDTH-1):0] Address_i_tb;
wire [(DATA_WIDTH-1):0] Instruction_o_tb;

  
Program_Memory
#
(
	.MEMORY_DEPTH(MEMORY_DEPTH),
	.DATA_WIDTH(DATA_WIDTH)
)
DUV
(
	.Address_i(Address_i_tb),
	.Instruction_o(Instruction_o_tb)
);
/*********************************************************/
/*********************************************************/


initial begin
	#0 Address_i_tb = 32'h400000;
	#50 Address_i_tb = 32'h400004;
	#50 Address_i_tb = 32'h400008;
	#50 Address_i_tb = 32'h40000c;
	#50 Address_i_tb = 32'h400010;
	#50 Address_i_tb = 32'h400014;
	#50 Address_i_tb = 32'h400018;
	#50 Address_i_tb = 32'h40001c;
	#50 Address_i_tb = 32'h400020;

end


/*********************************************************/

endmodule
