//Testbench for D-flipflop synchronous reset with Enable
`timescale 1ns/1ps
module dff_enable_tb();
  //1.Signal declaration
  reg clk;
  reg reset;
  reg enable;
  reg d;
  wire q;
  //2.DUT instantiation
  dff_enable dut(.clk(clk),.reset(reset),.enable(enable),.d(d),.q(q));
  //3.Clock generation
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  //4.Stimulus
  initial begin
    $display("Time | rst en d | q");
    //initial values
    reset=1;
    enable=0;
    d=0;
    
    #13 reset=0; //takes effect on next posedge
    #10 d=1; //enable is 0, q<=q, q on hold
    #10 enable=1; //captures d and q=1 in next clock edge
    #10 d=0; //updates q=0 in next clock edge as enable is 1
    #10 reset=1; //updates q=0 in next clock edge as reset is 1
    #10 reset=0; //resumes q<=d in next clock edge as reset is 0, enable is 1
    #20 $finish;
  end
  //5.Obervation
  always @(posedge clk) begin
    $display("%4t | %b %b %b | %b",$time,reset,enable,d,q);
  end
endmodule
