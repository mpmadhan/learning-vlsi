//Testbench for 4-bit synchronous up-down counter
`timescale 1ns/1ps
module up_down_counter_tb();
  //1. Signal declaration
  reg clk;
  reg reset;
  reg enable;
  reg up_down;
  wire [3:0] count;
  //2. DUT instantiation
  up_down_counter dut(.clk(clk),.reset(reset),.enable(enable),.up_down(up_down),.count(count));
  //3. Clock generation
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  //4. Stimulus
  initial begin
    $display("Time | Rst En UpDown | Count");
    //initial values
    reset=1;
    enable=0;
    up_down=1;

    #13 reset=0;    //t=13 reset removed at t=15
    #10 enable=1;   //up counter starts at t=25
    #20 up_down=0;  //down counter starts at t=45
    #10 enable=0;   //counter hold the value at t=55
    #10 enable=1;   //down counter resumes at t=65
    repeat(16) @(posedge clk);  //repeat for 16 cycles
    #20 $finish;
  end
  //5. Observation
  always @(posedge clk) begin
    $display("%4t | %b %b %b | %b",$time,reset,enable,up_down,count);
  end
endmodule
