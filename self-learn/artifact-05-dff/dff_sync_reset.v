//D-Flipflop with Syncronous Reset
module dff_sync_reset(
  input clk,D,reset,
  output reg Q //reg used since Q is used inside always block
);
  always @(posedge clk) begin
    if(reset)
      Q<=0;
    else
      Q<=D;
  end
endmodule
