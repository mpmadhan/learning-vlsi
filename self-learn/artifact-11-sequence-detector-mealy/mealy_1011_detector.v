//RTL Code that demonstrated the detection of 1 0 1 1 and if detected, output is high for 1 clock cycle (Overlapping)
module mealy_1011_detector(
  //1. Ports
  input clk,
  input reset,
  input din,
  output reg detected
);
  //2. State encoding
  localparam S0 = 2'b00,
             S1 = 2'b01,
             S2 = 2'b10,
             S3 = 2'b11;
  //3. State registers
  reg[1:0] state, next_state;
  //3.1 Reset operation
  always @(posedge clk) begin
    if(reset)
      state <= S0;
    else
      state <= next_state;
  end
  //4. Next state + Mealy logic
  always @(*) begin
    next_state = state;
    detected = 0;

    case(state)
      S0: begin
        if(din)
          next_state = S1;
        else
          next_state = S0;
      end
      S1: begin
        if(din)
          next_state = S1;
        else
          next_state = S2;
      end
      S2: begin
        if(din)
          next_state = S3;
        else
          next_state = S0;
      end
      S3: begin
        if(din) begin
          next_state = S1;    //overlapping sequence detector, next_state = S0; for non-overlapping sequence detector
          detected = 1;
        end
        else
          next_state = S2;
      end
      endcase
    end
endmodule
