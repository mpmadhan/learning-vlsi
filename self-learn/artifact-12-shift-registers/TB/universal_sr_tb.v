//Testbench for Universal Shift Register
//Sel: 0: Hold, 1: Shift Right, 2: Shift Left, 3: Load
`timescale 1ns/1ps
module universal_sr_tb();
  //1. Signal declaration
  localparam WIDTH = 4;
  reg clk;
  reg reset;
  reg enable;
  reg [1:0] sel;
  reg left_in;
  reg right_in;
  reg [(WIDTH-1):0] din;
  wire [(WIDTH-1):0] dout;
  //2. DUT instantiation
  universal_sr #(.WIDTH(WIDTH)) dut(.clk(clk),.reset(reset),.enable(enable),.sel(sel),.left_in(left_in),.right_in(right_in),.din(din),.dout(dout));
  //3. Clock Generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  //4. Stimulus
  initial begin
    $display("Time | Rst En SEL Lin Rin Din Dout");
    $display("-----|----------------------------");
    reset = 1;
    enable = 0;
    sel = 2'b00;
    left_in = 0;
    right_in = 0;
    din = 0;

    #13 reset = 0;
    #10 enable = 1;
    #10 left_in = 1;
    #10 din = 4'b1001;
    #10 sel = 2'b11;
    #10 sel = 2'b01;
    
    #50 din = 4'b1101;
    #10 sel = 2'b11;
    #10 right_in = 1;
    #10 sel = 2'b10;
    #13 sel = 2'b00;
    #200 $finish;
  end
  //5. Observation
  initial begin
    $monitor("%4t | %b %b %2b %b %b %4b %4b",$time,reset,enable,sel,left_in,right_in,din,dout);
  end
  //6. Waveform Generation
  initial begin
    $dumpfile("universal_sr_tb.vcd");
    $dumpvars(0,universal_sr_tb);
  end
endmodule
    
