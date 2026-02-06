//Testbench for D-flipflop with synchronous reset
module dff_sync_reset_tb();
  reg clk;
  reg D;
  reg reset;
  wire Q;

  dff_sync_reset dut(.clk(clk),.D(D),.reset(reset),.Q(Q));

  initial begin    //creating clk
    clk=0;
    forever #5 clk=~clk;
  end

  initial begin
    reset=1;D=0;
    #13 reset=0;
    #10 D=0;
    #10 D=1;
  end

  always @(posedge clk) begin
    $display ("%b %b %b | %b",clk,reset,D,Q);
  end
