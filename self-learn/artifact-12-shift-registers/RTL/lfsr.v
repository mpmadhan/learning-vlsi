//RTL code that implemts Linear Feedback Shift Register
module lfsr #(parameter WIDTH = 4)(
  input clk,
  input reset,
  input enable,
  input load,
  input [(WIDTH-1):0] din,
  output reg [(WIDTH-1):0] dout
);
  reg [(WIDTH-1):0] shift_reg;
  always @(posedge clk) begin
    if(reset)
      shift_reg <= 0 + 1'b1 ; //{(WIDTH-1){1'b0},1'b1}
    else if(din == {WIDTH{1'b0}} 
      shift_reg <= shift_reg + 1'b1;    //so 0000 case won't be possible
    else if(load)
      shift_reg <= din;
    else if(enable)
      dout <= (din[WIDTH-1] ^ din[WIDTH-2]);
    else
      dout <= dout;
  end
endmodule
