//RTL Code that implements Universal Shift Register
//Universal shift register, 4 operations: 1.Hold, 2.Shift Right, 3.Shift Left, 4.Parallel load
module universal_sr #(parameter WIDTH = 4)(
  input clk,
  input reset,
  input [1:0] sel,
  input left_in,
  input right_in,
  input [(WIDTH-1):0] din,
  output [(WIDTH-1):0] dout
);
  reg [(WIDTH-1):0] shift_reg;
  always @(posedge clk, posedge reset) begin //Asynchronous Behaviour
    if(reset)
      shift_reg <= 0;
    else if(enable) begin
      case(sel)
        2'b01: shift_reg <= {right_in,shift_reg[(WIDTH-1):1]};
        2'b10: shift_reg <= {shift_reg[(WIDTH-2):0],left_in};
        2'b11: shift_reg <= din;
        default: shift_reg <= shift_reg;
      endcase
    end
  end
  assign dout = shift_reg;
endmodule
