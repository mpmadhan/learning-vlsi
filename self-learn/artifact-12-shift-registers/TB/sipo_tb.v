//Testbench for Serial IN Parallel OUT (SIPO) Shift register
`timescale 1ns/1ps
module sipo_tb();
  //1. Signal declaration
  localparam WIDTH = 4;
  reg clk;
  reg reset;
  reg din;
  wire [(WIDTH-1):0] dout;
  //2. DUT instantiation
  sipo #(.WIDTH(WIDTH)) dut(.clk(clk),.reset(reset),.din(din),.dout(dout));
  //3. Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  //4. Stimulus
  initial begin
    $display("Time | Rst Din Dout");
    $display("-----|-------------");
    reset = 1;
    din = 0;
    #10 din = 1; //applying d in reset state
    #13 reset = 0;
    #10 din = 1;
    #10 din = 0;
    #10 din = 1;
    #10 din = 1;
    #10 din = 0;
    #10 din = 1;
    #100 $finish;
  end
  //5. Obersvation
  always @(posedge clk) begin
    $display ("%4t | %b %b %b",$time, reset, din, dout);
  end
  //6. Waveform Generation
  initial begin
    $dumpfile("sipo_tb.vcd");
    $dumpvars(0,sipo_tb);
  end
endmodule
