# Traffic Signal FSM  
## Objective
To design and simulate a Traffic signal controller using FSM in verilog, The controller cycles through Red (5 cycles), Green (5 cycles), Yellow (2 cycles) with defined timing and a Reset operation that resets to Red.
## RTL:  
1. traffic_signal_fsm.v : RTL Code that demonstrates Traffic light FSM  
## TB:  
1. traffic_signal_fsm_tb.v : Testbench for testing traffic_signal_fsm.v

## State Encoding
|Current State | Encoding | 
|--------------|----------|
|      RED     |    2'b00 |
|     GREEN    |    2'b01 |
|     YELLOW   |    2'b10 |

## State Transition Table
|Current State | Condition (Counter) | Next State |
|--------------|---------------------|------------|
|      RED     |      count == 4     |    GREEN   |
|     GREEN    |      count == 4     |   YELLOW   |
|     YELLOW   |      count == 1     |     RED    |
