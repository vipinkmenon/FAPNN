module voter(
input  clk,
input  [15:0] class1,
input  [15:0] class2,
input  [15:0] class3,
output reg [1:0]  class
);

always @(posedge clk)
begin
    if(class1 > class2)
		if(class1 > class3)
			class <= 2'd1;
		else
			class <= 2'd3;
	else if(class2 > class3)
		class <= 2'd2;
	else
		class <= 2'd3;
end

endmodule