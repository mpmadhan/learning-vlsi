//4-bit Up-counter
module up_counter(
  input clk,
  input reset,
  input enable,
  output reg [3:0] count
);
  always @(posedge clk) begin
    if(reset)               //if reset=1 => count=0
      count <= 0;
    else if(enable)         //else if enable is 1 => count increments
      count <= count + 4'b0001;
    //if reset=0, enable = 0 => count holds
  end
endmodule
      
