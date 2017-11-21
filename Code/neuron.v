module neuron(
input wire   clk,
input wire   strWgt,
input wire   start,
input wire   train,
input [15:0] data,
input [15:0] sigma,
output  y
);

wire [15:0] wgt;
wire [47:0] mac;
reg [1:0] wrAddr;
reg [1:0] rdAddr;
reg dspClr;
reg state;
localparam IDLE = 'd0;

assign y = (mac > {32'd0,sigma}) ? 1'b1 : 1'b0;

xbip_dsp48_macro_0 dsp (
  .CLK(clk),  // input wire CLK
  .SCLR(dspClr),
  .A(data),      // input wire [15 : 0] A
  .B(wgt),      // input wire [15 : 0] B
  .P(mac)      // output wire [47 : 0] P
);

initial
begin
    wrAddr = 0;
    state = IDLE;
end

always @(posedge clk)
begin
    if(strWgt)
        wrAddr <= wrAddr+1'b1;
end

always @(posedge clk)
begin
    case(state)
        IDLE:begin
            dspClr <= 1'b1;
            rdAddr <= 3;
            if(start)
            begin
               dspClr <= 1'b0;
               rdAddr <= rdAddr+1;
            end
        end
    endcase
end

Ram wgtRam(
 .clk(clk),
 .wr_data(data),
 .rd_data(wgt),
 .wr_addr(wrAddr),
 .rd_addr(rdAddr),
 .wr_en(strWgt),
 .rd_en()
);

endmodule