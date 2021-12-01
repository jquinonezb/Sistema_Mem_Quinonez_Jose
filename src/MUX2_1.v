module MUX2_1
#(
	parameter WIDTH = 32
)
(
	input [WIDTH-1:0] data_ROM, data_RAM,
	input selector,
	output [WIDTH-1:0] data_o
);

assign data_o = (selector) ? data_ROM : data_RAM;

endmodule 