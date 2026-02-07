//D-Flipflop synchronous reset with enable 
module dff_enable(
  input clk,
  input reset,
  input enable,
  input d,
  output reg q
);

  always @(posedge clk) begin
    if(reset)       //if reset=1, q=0
      q<=0;
    else if(enable) //if enable=1, q=d
      q<=d;
    else            //if enable=0, q=q (holds value)
      q<=q;
  end
endmodule
