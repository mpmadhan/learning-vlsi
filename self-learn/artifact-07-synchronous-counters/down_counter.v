//RTL Code for 4-bit Synchronous Down counter
module down_counter(
  input clk,
  input reset,
  input enable,
  output reg [3:0] count
);

  always @(posedge clk) begin
    if(reset)
      count<=0;
    else if(enable)
      count<=count-1'b1;
  end
endmodule
