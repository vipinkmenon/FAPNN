module neuron(
input wire   clk,
input [15:0] x1,
input [15:0] x2,
input [15:0] x3,
input [15:0] x4,
input [15:0] w1,
input [15:0] w2,
input [15:0] w3,
input [15:0] w4,
input [15:0] sigma,
output reg [15:0] y
);

reg [31:0] p1,p2,p3,p4;
reg [31:0] sum;

always @(posedge clk)
begin
	p1 <= x1*w1;
	p2 <= x2*w1;
	p3 <= x3*w1;
	p4 <= x4*w1;
	sum <= p1+p2+p3+p4;
	if(sum[31:16] > sigma)
	    y <= sum[31:16];
	else
		y <= 0;
end

endmodule