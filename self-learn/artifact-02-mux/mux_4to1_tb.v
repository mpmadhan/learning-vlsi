//Testbench for 4:1 mux
module mux_4to1_tb;
  reg S0,S1,D0,D1,D2,D3;
  wire Y;

  mux_4to1(.SO(S0),.S1(S1),.D0(D0),.D1(D1),.D2(D2),.D3(D3),.Y(Y));
  initial begin
    //set data inputs
    D0=0;D1=1;D2=0;D3=1;

    //select D0
    S0=0;S1=0;
    //Select D1
    S0=0;S1=1; #10
    //Select D2
    S0=1;S1=0; #10
    //Select D3
    S0=1;S1=1; #10
    $finish;
  end
endmodule
