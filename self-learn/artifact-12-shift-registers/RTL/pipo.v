//RTL Code that implements PIPO (Parallel IN Parallel OUT) Shift Register
module pipo #(parameter WIDTH = 4)(
  input clk,
  input reset,
  input [(WIDTH-1):0] din,
  output reg [(WIDTH-1):0] dout
);
  always @(posedge clk) begin
    if(reset)
      dout <= 0;
    else
      dout <= din;
  end
