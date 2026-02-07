//Testbench for D-flipflop with synchronous reset
`timescale 1ns/1ps

module dff_sync_reset_tb();
  //1.Signal declaration
  reg clk;
  reg D;
  reg reset;
  wire Q;
  //2.DUT instantiation
  dff_sync_reset dut(.clk(clk),.D(D),.reset(reset),.Q(Q));
  //3.Clock generation
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  //4.Stimulus
  initial begin
    $display("Time | clk reset D | Q");
    reset=1;D=0; //applying reset
    #13 reset=0; //removing reset next clock edge, it will apply
    #10 D=1; //changing input and checking q in next clock edge
    #10 D=0; 
    #10 reset=1; //applying reset
    #10 D=1; //checking whether input changes when reset is ON
    #10 reset=0; //removing reset
    #20 $finish;
  end
  //5.Observation
  always @(posedge clk) begin
    $display ("%4t | %b %b %b | %b",$time,clk,reset,D,Q);
  end
endmodule
