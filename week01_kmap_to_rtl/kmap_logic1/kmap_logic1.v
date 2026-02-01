//For 3-variable K-map m(0,2,5,7)
module kmap_logic1(
  input A
  input B
  input C
  output Y);
  //for m(0,2,5,7): Y= (AC' + A'C)
  assign Y = (A & ~C) | (~A & C);
endmodule
