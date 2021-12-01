module TB_Memory;

parameter WIDTH = 32;
parameter DEPTH = 64;
reg write_enable_tb, clk_tb = 0;
reg [WIDTH-1:0] Write_Data_tb, Address_tb;

wire [WIDTH-1:0] Instruction_tb;

Memory_system 
#(
	.WIDTH(WIDTH),
	.MEMORY_DEPTH(DEPTH)
)
DUT
(
	.write_enable_i(write_enable_tb), 
	.clock(clk_tb),
	.Write_Data(Write_Data_tb),
	.Address_i(Address_tb),
	.Instruction_o(Instruction_tb)
);

/************************************************************/
// Clock generator
initial begin
    forever #2 clk_tb = !clk_tb;
end 

//Write Enable de 0 a 1
initial begin
	#0 write_enable_tb = 1'b0;
	#54 write_enable_tb = 1'b1;
	#40 write_enable_tb = 1'b0;
end

//Seleccion de direccion en la memoria
initial begin
	#0 Address_tb = 32'h400000;
	#18 Address_tb = 32'h400004;
	#20 Address_tb = 32'h400008;
	#16 Address_tb = 32'h40000c;
	#12 Address_tb = 32'h10010000;
	#8 Address_tb = 32'h1001000c;
	#10 Address_tb = 32'h10010014;
	#5 Address_tb = 32'h10010020;
	#5 Address_tb = 32'h10010034;
	#12 Address_tb = 32'h10010014;
	#12 Address_tb = 32'h10010000;
end

//Write data 
initial begin
	#0 Write_Data_tb = 32'h0;
	#52 Write_Data_tb = 32'hFFFF;
	#10  Write_Data_tb = 32'h123456;
	#10  Write_Data_tb = 32'h953CDA;
	#14  Write_Data_tb = 32'hAAAAAA;
	#10  Write_Data_tb = 32'h953CDA;
end

endmodule
