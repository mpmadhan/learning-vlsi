//RTL Code that implements SIPO (Serial IN Parllel OUT) Shift Register
module sipo #(parameter WIDTH = 4)(
  input clk,
  input reset,
  input din,
  output [(WIDTH-1):0] dout
);
  reg[(WIDTH-1):0] shift_reg;
  always @(posedge clk) begin
    if(reset)
      shift_reg <= 0;
    else
      shift_reg <= {shift_reg[(WIDTH-2):0],din};
  end
  assign dout = shift_reg;
endmodule
