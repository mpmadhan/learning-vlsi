//RTL Code that implements SISO (Serial In Serial Out) Shift register
module siso #(parameter WIDTH = 4)(
  input clk,
  input reset,
  input din,
  output reg dout
);
  reg [(WIDTH-1):0] shift_reg;
  int i;
  always @(posedge clk) begin
    if(reset)
      shift_reg <= 0;
    else 
      shift_reg <= {shift_reg[(WIDTH-2):0],din}; //width-1 is the MSB and we don't require LSB, so width-1-1 and concatenate din at LSB. [MSB..(LSB-1),din]
  end
  assign dout = shift_reg[WIDTH-1]; //assigning the MSB to dout
endmodule
