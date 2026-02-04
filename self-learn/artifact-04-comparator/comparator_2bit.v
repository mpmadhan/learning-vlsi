//2-bit comparator
module comparator_2bit(
  input [1:0] A,
  input [1:0] B,
  output A_gt_B,
  output A_eq_B,
  output A_lt_B;
);
  wire msb,lsb;
  //checking whether the MSB are same
  assign msb = ~(A[1] ^ B[1]); //xnor of two values checks whether two values are equal
  assign lsb = ~(A[0] ^ B[0]);
  //A>B if A[1]>B[1] or A[1]==B[1] & A[0]>B[0]
  assign A_gt_B = (A[1] & ~B[1]) | (msb & (A[0] & ~B[0]));
  // (A & ~B) = 1 bit comparator and output 1 if A>B
  //A<B if A[1]<B[1] or A[1]==B[1] & A[0]<B[0]
  assign A_lt_B = (~A[1] & B[1]) | (msb & (~A[0] & B[0]));
  // (~A & B) = 1 bit comparator and output 1 is A<B
  assign A_eq_B = (msb & lsb);
endmodule
