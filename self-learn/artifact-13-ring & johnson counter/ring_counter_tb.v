//Testbench for Parameterized Ring Counter
`timescale 1ns/1ps
module ring_counter_tb();
  //1. Signal declaraion
  localparam WIDTH = 4;
  reg clk;
  reg reset;
  reg enable;
  wire [(WIDTH-1):0] dout;
  //2. DUT instantiaion
  ring_counter #(.WIDTH(WIDTH)) dut(.clk(clk),.reset(reset),.enable(enable),.dout(dout));
  //3. Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  //4. Stimulus
  initial begin
    $display("Time | Rst En Dout");
    $display("-----|------------");
    reset = 1;
    enable = 0;

    #13 reset = 0;
    enable = 1;
    #20 enable = 0;
    #10 enable = 1;
    #100 reset = 1;
    #10 reset = 0;
    #100 $finish;
  end
  //5. Observation
  initial begin
    $monitor("%4t | %b %b %b",$time,reset,enable,dout);
  end
  //6. Waveform Generation
  initial begin
    $dumpfile("ring_counter_tb.vcd");
    $dumpvars(0,ring_counter_tb);
  end
endmodule
