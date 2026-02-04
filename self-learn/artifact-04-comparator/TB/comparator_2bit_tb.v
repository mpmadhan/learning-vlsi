//Testbench for 2-BIT Comparator
module comparator_2bit_tb();
  reg [1:0] A;
  reg [1:0] B;
  wire A_gt_B;
  wire A_lt_B;
  wire A_eq_B;

  comparator_2bit DUT(.A(A),.B(B),.A_gt_B(A_gt_B),.A_lt_B(A_lt_B),.A_eq_B(A_eq_B));

  integer i,j;  
  initial begin
    $display ("A B | GT EQ LT");
    for(i=0;i<4;i=i+1) begin    //A loop
      for(j=0;j<4;j=j+1) begin  //B loop
        A=i;
        B=j;
        #10;
        $display ("%b %b | %b %b %b", A, B, A_gt_B, A_eq_B, A_lt_B);
        if(A_gt_B + A_eq_B + A_lt_B != 1) begin
          $display ("ERROR at A=%b B=%b", A, B);
        end
      end
    end
    $finish;
  end
endmodule
/*
  initial begin
    A=00;B=00;
    #10 A=00;B=01;
    #10 A=00;B=10;
    #10 A=00;B=11;
    #10 A=01;B=00;
    #10 A=01;B=01;
    #10 A=01;B=10;
    #10 A=01;B=11;
    #10 A=10;B=00;
    #10 A=10;B=01;
    #10 A=10;B=10;
    #10 A=10;B=11;
    #10 A=11;B=00;
    #10 A=11;B=01;
    #10 A=11;B=10;
    #10 A=11;B=11;
    #10 $display;
    $finish;
  end
endmodule
*/ 
