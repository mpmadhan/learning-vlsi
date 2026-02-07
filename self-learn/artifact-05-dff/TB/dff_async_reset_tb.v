//Testbench for Asynchronous D-flipflop
`timescale 1ns/1ps
module dff_async_reset_tb();
  //1.Signal declaration
  reg clk;
  reg D;
  reg reset;
  wire Q;
  //2.DUT instantiation
  dff_async_reset dut(.clk(clk),.D(D),.reset(reset),.Q(Q));
  //3.Clock generation
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  //4.Stimulus
  initial begin
    $display("Time | clk reset D | Q");
    reset=0;D=0;
    #13 reset=1; //applying reset between clock edge
    #10 D=1;     //Q=0 as it is in reset
    #10 reset=0; //removing reset
    #10 D=1;     //updates next clock edge 
    #20 $finish;
  end
  //5.Observation
  always @(posedge clk) begin
    $display("%4t | %b %b %b | %b",$time,clk,reset,D,Q);
  end
  always @(posedge reset) begin
    $display("%4t | ASYNC Reset Applied | Q=%b", $time,Q );
  end
endmodule
    
