//2-to-4 Decoder logic
//A B | Y0 Y1 Y2 Y3
//0 0 | 1  0  0  0
//0 1 | 0  1  0  0
//1 0 | 0  0  1  0
//1 1 | 0  0  0  1
module decoder_2to4(
  input A,B,
  output Y0,Y1,Y2,Y3
);
  
  assign Y0 = (~A & ~B);
  assign Y1 = (~A & B);
  assign Y2 = (A & ~B);
  assign Y3 = (A & B);
  end
endmodule
