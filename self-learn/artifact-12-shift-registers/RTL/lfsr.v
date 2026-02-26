//RTL code that implemts Linear Feedback Shift Register
module lfsr #(parameter WIDTH = 4)(
  input clk,
  input reset,
  input enable,
  input load,
  input [(WIDTH-1):0] din,
  output [(WIDTH-1):0] dout
);
  reg [(WIDTH-1):0] shift_reg;
  assign feedback = {(shift_reg[WIDTH-1])^(shift_reg[WIDTH-2])}
  always @(posedge clk) begin
    if(reset)
      shift_reg <= {{(WIDTH-1){1'b0}},{1'b1}};
    else if (load)
      shift_reg <= din;
    else if (enable)
      shift_reg <= {feedback,shift_reg[(WIDTH-1):1]};
  end
  assign dout = shift_reg;
endmodule
