//Testbench for Enable Generation.
`timescale 1ns/1ps
module enable_generation_tb();
  //1. Signal Generation
  localparam PULSE_WIDTH = 5;
  reg clk;
  reg reset;
  wire [$clog2(PULSE_WIDTH)-1:0] count;
  wire en_pulse;
  //2. DUT Instantiation
  enable_generation #(.PULSE_WIDTH(PULSE_WIDTH)) dut(.clk(clk),.reset(reset),.en_pulse(en_pulse));
  //3. Clk Generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  //4. Stimulus
  initial begin
    $display ("Time | Rst Count | EN");
    //initial values
    reset = 1;

    #13 reset = 0;
    #30 reset = 1;
    #10 reset = 0;
    #200 $finish
  end
  //5. Observation
  always @(posedge clk) begin
    $display ("%4t | %b %b | %b",$time,reset,count,en_pulse);
  end
endmodule
