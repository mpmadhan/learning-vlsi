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
    reset=1;D=0; //applying reset
    #13 reset=0; //removing reset next clock edge, it will apply
    #10 D=1; //changing input and checking q in next clock edge
    #10 D=0; 
    #10 reset=1; //applying reset
    #10 D=1; //checking whether input changes when reset is ON
    #10 reset=0; //removing reset
  end

  always @(posedge clk) begin
    $display ("%b %b %b | %b",clk,reset,D,Q);
  end
