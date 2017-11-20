module avgr(
input clk,
input [15:0] val1,
input [15:0] val2,
input [15:0] val3,
input [15:0] val4,
input [15:0] val5,
input [15:0] val6,
input [15:0] val7,
input [15:0] val8,
input [15:0] val9,
input [15:0] val10,
input [15:0] val11,
input [15:0] val12,
input [15:0] val13,
input [15:0] val14,
input [15:0] val15,
input [15:0] val16,
output reg [15:0] avg
);

always @(posedge clk)
begin
	avg = (val1+val2+val3+val4+val5+val6+val7+val8+val9+val10+val11+val12+val13+val14+val15+val16)/16;
end


endmodule