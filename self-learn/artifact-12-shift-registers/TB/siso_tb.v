//Testbench for Serial IN Serial OUT (SISO) Shift Register
`timescale 1ns/1ps
module siso_tb();
  //1. Signal declaration
  localparam WIDTH = 4;
  reg clk;
  reg reset;
  reg din;
  wire dout;
  //2. DUT instantiation
  siso #(.WIDTH(WIDTH)) dut(.clk(clk),.reset(reset),.din(din),.dout(dout));
  //3. Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  //4. Stimulus
  initial begin
    $display ("Time | Rst Din Dout");
    $display ("-----|-------------");
    reset = 1;
    #10 reset = 0;
    #13 din = 1;
    #10 din = 0;
    #10 din = 1;
    #10 reset = 1;
    #10 din = 0;
    #10 reset = 0;
    #10 din = 1;
    #100 $finish;
  end
  //5. Observation
  always @(posedge clk) begin
    $display("%4t | %b %b %b",$time,reset,din,dout);
  end
  //6. Waveform
  initial begin
    dumpfile("siso_tb.vcd");
    dumpvars(0,siso_tb);
  end
endmodule
