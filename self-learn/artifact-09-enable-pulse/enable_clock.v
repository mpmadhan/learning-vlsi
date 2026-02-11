//RTL Code for Producing pulse for Enable signal
module enable_clock #(parameter PULSE_PERIOD = 5)(
  input clk,
  input reset,
  output reg en_pulse
);
  reg [PULSE_PERIOD-1:0] count;
  always @(posedge clk) begin
    if(reset)
      en_pulse<=0;
    else
      count<=count+1;
  end
  initial begin
    e
      
  
