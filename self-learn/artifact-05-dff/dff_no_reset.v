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

//with Reset
module dff(
  input D,Rst,
  output Q
);

  always @(posedge clk, Rst) begin
    if (Rst)
      Q<=0;
    else
      Q<=D;
  end
endmodule
