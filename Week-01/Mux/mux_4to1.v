//4:1 Mux
module mux_4to1(
  input S0,S1,D0,D1,D2,D3,
  output Y);
  
  assign Y =  (~S0 & ~S1 & D0) | //S0:0 S1:0 D0 (when s0,s1:00, o/p selects D0)
              (~S0 & S1 & D1) | 
              (S0 & ~S1 & D2) | 
              (S0 & S1 & D3); // S0:1 S1:1 D3 (when s0,s1:11, o/p selects D3)
endmodule
