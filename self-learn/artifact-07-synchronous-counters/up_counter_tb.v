//Testbench for 4-bit UP Counter
`timescale 1ns/1ps
module up_counter_tb();
  //1.Signal declaration
  reg clk;
  reg reset;
  reg enable;
  wire [3:0] count;
  //2.DUT Instantiation
  up_counter dut(.clk(clk),.reset(reset),.enable(enable),.count(count));
  //3.Clock generation
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  //4.Stimulus
  initial begin
    //initial values
    $display("Time | rst en | count");
    reset = 1;
    enable = 0;

    #13 reset = 0;enable=1; //t=23, counter starts incrementing from next clock cycle (t=25)
    #10 reset = 1; //t=33, checks whether counter resets to zero (from next clock edge)
    #10 reset = 0; //t=43, removing reset, counter starts to count from 0 again from next clock edge
    #10 enable = 0; //t=53, checks if counter is incrementing when enable=0
    #10 enable =1; //t=63, resumes counting
    repeat(16) @(posedge clk); // 16 posedges 
    $finish;
  end
  //5.Observation
  always @(posedge clk) begin
    $display("%4t | %b %b | %b",$time,reset,enable,count);
  end
endmodule
