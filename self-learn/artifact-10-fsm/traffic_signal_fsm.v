/*RTL Code for FSM demonstration of traffic signal
Red = 5 cycles, Green = 5 cycles, Yellow = 2 cycles */
module traffic_signal_fsm(
  input clk,
  input reset,
  output reg red,
  output reg green,
  output reg yellow
);

  //State encoding
  localparam RED = 2'b00;
  localparam GREEN = 2'b01;
  localparam YELLOW = 2'b10;

  reg[1:0] state, next_state;

  //Counter for timing inside state
  reg[2:0] count; //couting upto 5
  reg counter_reset;

  //Reset logic
  always @(posedge clk) begin
    if(reset)
      state <= RED;
    else
      state <= next_state;
  end
  //Counter logic
  always @(posedge clk) begin
    if(reset || counter_reset)
      count <= 0;
    else
      count <= count+1;
  end
  //Next state logic
  always @(*) begin
    next_state = state;
    counter_reset = 0;
    case(state)
      RED: begin
        if(count == 4) begin
          next_state = GREEN;
          counter_reset = 1;
        end
        else
          next_state = RED;
      end
      GREEN: begin
        if(count == 4) begin
          next_state = YELLOW;
          counter_reset = 1;
        end
        else
          next_state = GREEN;
      end
      YELLOW: begin
        if(count == 1) begin
          next_state = RED;
          counter_reset = 1;
        end
        else
          next_state = YELLOW;
      end
      default: next_state = RED;
    endcase
  end
  //Output logic
  always @(*) begin
    red = (state == RED);
    green = (state == GREEN);
    yellow = (state == YELLOW);
  end
endmodule
