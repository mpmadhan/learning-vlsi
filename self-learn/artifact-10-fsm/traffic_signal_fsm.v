/*RTL Code for FSM demonstration of traffic signal
Red = 5 cycles, Green = 5 cycles, Yellow = 2 cycles */
module traffic_signal_fsm(
  //1. Ports
  input clk,
  input reset,
  output reg red,
  output reg green,
  output reg yellow
);
  //2. State Encoding
  localparam RED = 2'b00;
  localparam GREEN = 2'b01;
  localparam YELLOW = 2'b10;

  //3. State Registers (Sequential block)
  reg[1:0] state, next_state;
  always @(posedge clk) begin
    if(reset)
      state <= RED;
    else
      state <= next_state;
  end
  //4. Count Block
  reg[2:0] count;
  reg counter_reset;
  always @(posedge clk) begin
    if(reset || counter_reset)
      count <= 0;
    else
      count <= count+1;
  end
  //5. Next state logic (Combinational block)
  always @(*) begin
    next_state = state;
    counter_reset = 0;
    case(state)
      RED: begin
        if(count == 4) begin
          next_state = GREEN;
          counter_reset = 1;
        end
      end
      GREEN: begin
        if(count == 4) begin
          next_state = YELLOW;
          counter_reset = 1;
        end
      end
      YELLOW: begin
        if(count == 1) begin
          next_state = RED;
          counter_reset = 1;
        end
      end
      default: next_state = RED;
    endcase
  end
  //6. Output logic
  always @(*) begin
    red = (state == RED);
    green = (state == GREEN);
    yellow = (state == YELLOW);
  end
endmodule
