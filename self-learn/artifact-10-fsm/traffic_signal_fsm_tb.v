//TB for Traffic signal FSM
`timescale 1ns/1ps
module traffic_signal_fsm_tb();
  //1. Signal declaration
  reg clk;
  reg reset;
  wire red;
  wire green;
  wire yellow;
  //2. DUT instantiation
  traffic_signal_fsm dut(.clk(clk),.reset(reset),.red(red),.green(green),.yellow(yellow));
  //3. Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  //4. Stimulus
  initial begin
    $display ("Time | Rst | R G Y");
    $display ("-----|-----|------");
    reset = 1;

    #10 reset = 0;
    repeat(12) @(posedge clk); //5+5+2 clock cycle to complete one full process
    #43 reset = 1;    //applying reset in middle of the process
    #10 reset = 0;
    #100 $finish;
  end
  //5. Observation
  always @(posedge clk) begin
    $display ("%4t | %b | %b %b %b",$time,reset,red,green,yellow);
  end
  //6. Waveform
  initial begin
    $dumpfile("traffic.vcd");
    $dumpvars(0,traffic_signal_fsm_tb);
  end
endmodule
