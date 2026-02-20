//Testebench for mealy sequence detector 1011
`timescale 1ns/1ps
module mealy_1011_detector_tb();
  //1. Signal declaration
  reg clk;
  reg reset;
  reg din;
  wire detected;
  //2. DUT instantiation
  mealy_1011_detector dut(.clk(clk),.reset(reset),.din(din),.detected(detected));
  //3. Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  //4. Stimulus
  initial begin
    $display ("Time | Rst | Din | Detected");
    $display ("-----|-----|-----|---------");
    //initialize
    reset = 1;
    din = 0;
    repeat(2) @(posedge clk); //hold reset for 2 clock cycles
    reset = 0;
    //Basic 1011 test
    @(posedge clk) din = 1;
    @(posedge clk) din = 0;
    @(posedge clk) din = 1;
    @(posedge clk) din = 1;
    //Overlapping test
    @(posedge clk) din = 0;
    @(posedge clk) din = 1;
    @(posedge clk) din = 1;
    //Mid-reset test
    @(posedge clk) din = 0;
    @(posedge clk) din = 1;
    @(posedge clk) reset = 1;
    @(posedge clk) reset = 0;
    //Basic 1011 test
    @(posedge clk) din = 1;
    @(posedge clk) din = 0;
    @(posedge clk) din = 1;
    @(posedge clk) din = 1;
    
    repeat(3) @(posedge clk);
    $finish;
  end
  //5. Observation
  always @(posedge clk) begin
    $display ("%4t | %b | %b | %b ",$time,reset,din,detected);
  end
  //6. Waveform
  initial begin
    $dumpfile("mealy_1011_detector_tb.vcd");
    $dumpvars(0,mealy_1011_detector_tb);
  end
endmodule
