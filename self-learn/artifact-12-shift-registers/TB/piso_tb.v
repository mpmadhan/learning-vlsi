//Testbench for PISO (Parallel IN Serial OUT) Shift Register
`timescale 1ns/1ps
module piso_tb();
  //1. Signal declaration
  localparam WIDTH = 4;
  reg clk;
  reg reset;
  reg [(WIDTH-1):0]din;
  reg load;
  wire dout;
  //2. DUT instantiation
  piso #(.WIDTH(WIDTH)) dut(.clk(clk),.reset(reset),.din(din),.load(load),.dout(dout));
  //3. Clock Generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  //4. Stimulus
  initial begin
    $display("Time | Rst  Load  Din  Dout");
    $display("-----|---------------------");
    reset = 1;
    din = 0;
    load = 0;

    #10 din = 4'b0110; //applying input at reset stage
    #13 reset = 0;
    #10 din = 4'b1101;
    #10 load = 1;
    #10 load = 0;
    #100 $finish;
  end
  //5. Observation
  initial begin
    $monitor("%4t | %b  %b  %4b  %b",$time,reset,load,din,dout);
  end
  //6. Waveform Generation
  initial begin
    $dumpfile("piso_tb.vcd");
    $dumpvars(0,piso_tb);
  end
endmodule
