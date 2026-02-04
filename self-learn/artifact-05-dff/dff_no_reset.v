//D-flipflop
//without Reset
module dff(
  input clk
  input D,
  output reg Q
);

  always @(posedge clk) begin
    Q<=D; //non-blocking assignments for memory elements
  end
endmodule
