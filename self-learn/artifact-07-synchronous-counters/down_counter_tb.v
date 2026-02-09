//Testbench for 4-bit synchronous down counter
`timescale 1ns/1ps
module down_counter_tb();
  //1.Signal declaration
  reg clk;
  reg reset;
  reg enable;
  wire [3:0] count;
  //2.DUT instantiation
  down_counter dut(.clk(clk),.reset(reset),.enable(enable),.count(count));
  //3.Clock generation
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  //4.Stimulus
  initial begin
    $display("Time | rst en | count");
    //initial values
    reset
