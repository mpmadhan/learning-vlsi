//Testbench for D-Flipflop with no Reset
module dff_no_reset_tb();
  reg clk,D;
  wire Q;

  dff_no_reset DUT(.clk(clk),.D(D),.Q(Q));

  initial begin    //Creating CLK
    clk=0;
    forever 
      #5 clk=~clk;
  end
  
  initial begin    //Change of inputs
    $display ("clk D | Q");
    d=0;
    #13 d=1; //change in between posedges of clock
    #10 d=0;
    #10 d=1;
    #10 d=0;
    #20 $finish;
  end

  always@(posedge clk) begin    //Displaying at posedge
    $display("%b %b | %b",clk,D,Q);
  end
endmodule
