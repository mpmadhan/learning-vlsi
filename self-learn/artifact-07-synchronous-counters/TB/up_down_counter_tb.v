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
  up_down_counter dut(.clk(clk),.reset(reset),.enable(enable),.up_down(up_down));
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

    #13 reset=0;
    #10 enable=1;
    #20 up_down=0;
    #10 enable=0;
    #10 enable=1;
    repeat(16) @(posedge clk);
    #20 $finish;
  end
  //5. Observation
  always @(posedge clk) begin
    $display("%4t | %b %b %b | %b",$time,reset,enable,up_down,count);
  end
endmodule
