//RTL for 4-bit synchronous Up-Down counter
module up_down_counter(
  input clk,
  input reset,
  input enable,
  input up_down,
  output reg [3:0] count
);

  always @(posedge clk) begin
    if(reset)
      count<=4'b000;
    else if(enable) begin
      if(up_down)              //if up_down=1, counter increments value when enable=1,reset=0
        count<=count+4'b0001;
      else                     //if up_down=0, counter decrements value when enable=1,reset=0
        count<=count-4'b0001;
    end
  end
endmodule
