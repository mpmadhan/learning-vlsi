//RTL Code that implements PISO (Parallel IN Serial OUT) Shift Register
module piso #(parameter WIDTH = 4)(
  input clk,
  input reset,
  input load,
  input [(WIDTH-1):0] din,
  output dout
);
  reg[(WIDTH-1):0] shift_reg;
  always @(posedge clk) begin
    if(reset)
      shift_reg <= 0;
    else if(load) 
      shift_reg <= din;
    else
      shift_reg <= {shift_reg[(WIDTH-2):0],1'b0};
  end
  assign dout = shift_reg[WIDTH-1];
endmodule
