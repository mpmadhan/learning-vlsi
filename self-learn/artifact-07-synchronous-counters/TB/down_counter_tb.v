//Testbench for 4-bit synchronous down counter
`timescale 1ns/1ps
module down_counter_tb();
  //1.Signal declaration
  reg clk;
  reg reset;
  reg enable;
  wire [3:0] count;
  //2.DUT instantiation
  down_counter dut(.clk(clk),.reset(reset),.enable(enable),.count(count));
  //3.Clock generation
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  //4.Stimulus
  initial begin
    $display("Time | rst en | count");
    //initial values
    reset = 1;
    enable = 0;
    
    #13 reset = 0; //t=13, removing reset in next clock cycle (t=15)
    #10 enable = 1; //t=23, enable counter, counter decrements from t=25
    #10 enable = 0; // t=33, disable counter, counter holds the value from t=35
    #10 enable = 1; //t=43, enable counter, counter decrements from t=45
    repeat(16) @(posedge clk);
    #20 $finish;
  end
  //5.Observation
  always @(posedge clk) begin
    $display("%4t | %b %b | %b",$time,reset,enable,count);
  end
endmodule
