//Testbench for Linear Feedback Shift Register
module lfsr_tb();
  //1. Signal declaration
  localparam WIDTH = 4;
  reg clk;
  reg reset;
  reg enable;
  reg load;
  reg [(WIDTH-1):0] din;
  wire [(WIDTH-1):0] dout;
  //2. DUT instantiation
  lfsr #(.WIDTH(WIDTH)) dut(.clk(clk),.reset(reset),.enable(enable),.load(load),.din(din),.dout(dout));
  //3. Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  //4. Stimulus
  initial begin
    $display("Time | Rst En L Din Dout");
    $display("-----|------------------");
    reset = 1;
    load = 0;
    enable = 0;
    din = 0;

    #10 reset = 1'b0; // removing reset
    #10 din = 4'b1001; //applying input
    #10 load = 1'b1;  //loading input into shift_reg
    #10 load = 1'b0; //loaded din value and ready for shifting
    #10 enable = 1'b1; //enable is 1 so shift process starts
    #200;
    $display ("Total enabled cycle: %0d",count);
    $finish;
  end
  //count logic
  integer count;
  initial count = 0;
  always @(posedge clk) begin
    if(reset)
      count <= 0;
    else if(enable)
      count <= count + 1;
  end
  //5. Observation
  initial begin
    $monitor("%4t | %b %b %b %4b %4b",$time,reset,enable,load,din,dout);
  end
  //6. Waveform generation
  initial begin
    $dumpfile("lfsr_tb.vcd");
    $dumpvars(0,lfsr_tb);
  end
endmodule
