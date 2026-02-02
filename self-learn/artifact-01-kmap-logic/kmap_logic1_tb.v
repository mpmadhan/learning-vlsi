//Testbench for kmap_logic1.v, 3 variable K-map
module kmap_logic1_tb;
  reg A,B,C;      //in Testbench inputs should be mentioned as "reg"
  wire Y;         //in Testbench outputs should be mentioned as "wire"

  kmap_1 TB(.A(A), .B(B), .C(C), .Y(Y)); //TB here is instantiation, any name can be given
  //can be mentioned as kmap_1 TB(A,B,C,Y) if the inputs are given in same order as in module
  initial begin
    //all the cases for A,B,C (2^3=8 combinations)
    A=0; B=0; C=0;
    #10 A=0; B=0; C=1; //10 time units delay
    #10 A=0; B=1; C=0;
    #10 A=0; B=1; C=1;
    #10 A=1; B=0; C=0;
    #10 A=1; B=0; C=1;
    #10 A=1; B=1; C=0;
    #10 A=1; B=1; C=1;
    #10 $finish;
  end
endmodule
