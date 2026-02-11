/*RTL Code for producing Enable signal
Basic Theory: Creating enable with the help of count,
Count is a counter that counts the number of posedges,
Once the amount of posedges(mentioned in PULSE_WIDTH) is completed enable signal is 1 for 1 clock cycle. */

module enable_clock #(parameter PULSE_WIDTH = 5)(
  input clk,
  input reset,
  output reg en_pulse
);
//$clog2(N) gives the minimum number of bits required to represent (N-1).
  reg [$clog2(PULSE_WIDTH)-1:0] count;
  always @(posedge clk) begin
    if(reset) begin
      en_pulse <= 0;
      count <= 0;
    end
    else begin
      if(count==(PULSE_WIDTH-1)) begin
        count <= 0;
        en_pulse <= 1'b1;
      end
      else begin
        count <= count + 1'b1;
        en_pulse <= 1'b0;
      end
    end
  end
