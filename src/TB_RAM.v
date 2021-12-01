module TB_RAM;

parameter MEMORY_DEPTH = 64;
parameter DATA_WIDTH = 32;
reg clk_tb = 0;
reg Write_Enable_i_tb;
reg [(DATA_WIDTH-1):0] Address_i_tb;
reg [(DATA_WIDTH-1):0] Write_Data_i_tb;
wire [(DATA_WIDTH-1):0] Read_Data_o_tb;
  
Data_Memory
#
(
	.MEMORY_DEPTH(MEMORY_DEPTH),
	.DATA_WIDTH(DATA_WIDTH)
)
UUT
(
	.clk(clk_tb),
	.Write_Enable_i(Write_Enable_i_tb),
	.Address_i(Address_i_tb),
	.Write_Data_i(Write_Data_i_tb),
	.Read_Data_o(Read_Data_o_tb)
);
/*********************************************************/
initial // Clock generator
  begin
    forever #2 clk_tb = !clk_tb;
  end
/*********************************************************/


initial begin
	#1 Write_Enable_i_tb = 1;
	#69 Write_Enable_i_tb = 0;
end

initial begin
	
	#0 Address_i_tb = 32'h10010000;
	#10 Address_i_tb = 32'h10010000;
	#12 Address_i_tb = 32'h10010008;
	#12 Address_i_tb = 32'h1001000c;
	#12 Address_i_tb = 32'h10010010;
	#12 Address_i_tb = 32'h10010014;
	#12 Address_i_tb = 32'h10010004;
	#5 Address_i_tb = 32'h10010008;
	#5 Address_i_tb = 32'h1001000c;
end

initial begin

	#0 Write_Data_i_tb <= 32'hFFFFFFFF;
	#20 Write_Data_i_tb <= 32'h12345678;
	#12 Write_Data_i_tb <= 32'h98761234;
	#12 Write_Data_i_tb <= 32'hA0A0A0A0;
	#12 Write_Data_i_tb <= 32'hABCDEF12;
end

/*********************************************************/

endmodule
