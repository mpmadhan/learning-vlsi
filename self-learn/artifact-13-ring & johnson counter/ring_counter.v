//RTL Code for Ring counter, Ring counter: 0001 -> 0010 -> 0100 -> 1000 -> 0001 ...
module ring_counter #(parameter WIDTH = 4)(
  input clk,
  input reset,
  input enable,
  output [(WIDTH-1):0] dout
);
  reg [(WIDTH-1):0] shift_reg;
  
  always @(posedge clk or posedge reset) begin
    if(reset)
      shift_reg <= {{(WIDTH-1){1'b0}},1'b1};
    else if(enable) begin
      //if(! $onehot(shift_reg)) finds whether exactly only one bit is there in the register
      if(shift_reg == 0 || (shift_reg & (shift_reg-1))!=0)    //And with its -1 value, if only 1 bit is one, the ouput will definitely we zero.
        shift_reg <= {{(WIDTH-1){1'b0}},1'b1};
      else
        shift_reg <= {shift_reg[(WIDTH-2):0],shift_reg[(WIDTH-1)]};
    end
  end
  assign dout = shift_reg;
endmodule
