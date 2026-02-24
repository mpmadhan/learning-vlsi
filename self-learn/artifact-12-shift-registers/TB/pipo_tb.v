//Testbench for PIPO (Parallel IN Parallel OUT) Shift Register
module pipo_tb();
  //1. Signal declaration
  localparam WIDTH = 4;
  reg clk;
  reg reset;
  reg [(WIDTH-1):0] din;
  wire [(WIDTH-1):0] dout;
  //2. DUT instantiation
  pipo #(.WIDTH(WIDTH)) dut(.clk(clk),.reset(reset),.din(din),.dout(dout));
  //3. Clock Generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  //4. Stimulus
  initial begin
    $display("Time | Rst   Din   Dout");
    $display("-----|-----------------");
    reset = 1;
    din = 0;
    #10 din = 4'b1011; //applying input when reset is 1
    #13 reset = 0;
    #10 din = 4'b1010;
    #16 din = 4'b1100;
    #100 $finish;
  end
  //5. Observation
  initial begin
    $monitor("%4t | %b   %4b   %4b",$time,reset,din,dout);
  end
  //6. Waveform
  initial begin
    $dumpfile("pipo_tb.vcd");
    $dumpvars(0,pipo_tb);
  end
endmodule
