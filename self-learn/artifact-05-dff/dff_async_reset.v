//D-flipflop with Asynchronous reset
module dff_async_reset(
  input clk,
  input reset,
  input D,
  output reg Q
);

  always @(posedge clk or posedge reset) begin
    if(reset)
      Q<=0;
    else
      Q<=D;
  end
endmodule
