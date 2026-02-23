//RTL Code that implements SISO (Serial In Serial Out) Shift register
module siso #(parameter WIDTH = 4)(
  input clk,
  input reset,
  input din,
  output dout
);
  reg [(WIDTH-1):0] shift_reg;
  always @(posedge clk) begin
    if(reset)
      shift_reg <= 0;
    else 
      shift_reg <= {shift_reg[(WIDTH-2):0],din}; //[MSB..(LSB-1),din]
  end
  assign dout = shift_reg[WIDTH-1]; //assigning the MSB to dout
endmodule
