//4-variable K-map logic in verilog
module kmap_logic2(
  input A,B,C,D,
  output Y
);
  //for m(0,1,4,6,10,12,15) random nos.
  assign Y = (~A & ~B & ~C) | (~A & B & ~D) | (B & ~C & ~D) | (A & C & D);
endmodule
