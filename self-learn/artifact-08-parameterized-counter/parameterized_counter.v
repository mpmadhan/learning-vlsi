//RTL for Parameterized UP-DOWN counter (N-bit)
module parameterized_counter #(parameter WIDTH = 4)(
  input clk,
  input reset,
  input enable,
  input dir,
  output reg [WIDTH-1:0] count
);

  always @(posedge clk) begin
    if(reset)
      count <= {WIDTH{1'b0}};      //count<=0;
    else if(enable) begin
      if(dir)
        count <= count + 1'b1;
      else
        count <= count - 1'b1;
  end
endmodule
