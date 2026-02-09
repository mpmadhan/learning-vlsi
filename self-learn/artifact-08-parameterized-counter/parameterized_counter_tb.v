//Testbench for Parameterized UP-Down counter (N-bit)
`timescale 1ns/1ps

module parameterized_counter_tb();
  //1. Signal Declaration
  localparam WIDTH = 5;
  
  reg clk;
  reg reset;
  reg enable;
  reg dir;
  wire [WIDTH-1:0] count;
  //2. DUT Instantiation
  parameterized_counter #(.WIDTH(WIDTH)) dut(.clk(clk),.reset(reset),.enable(enable),.dir(dir),.count(count));
  //3. Clock Generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  //4. Stimulus
  initial begin
    $display("Counter WIDTH = %0d",WIDTH);
    $display("Time | Rst En Dir | Count");
    //initial values
    reset = 1;
    enable = 0;
    dir = 1;

    #13 reset = 0;   //t=13, reset will be applies at next clock at t=15
    #10 enable = 1;  //t=23, counter enable at t=25
    #20 dir = 0;     //t=43, counter decrements at t=45
    #10 dir = 1;     //t=53, counter increments at t=55
    repeat((2**WIDTH)) @(posedge clk);
    #20 $finish;
  end
  //5. Observation
  always @(posedge clk) begin
    $display("%4t | %b %b %b | %b",$time,reset,enable,dir,count);
  end
endmodule
