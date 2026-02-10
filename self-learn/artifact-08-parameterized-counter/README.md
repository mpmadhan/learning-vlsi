# Parameterized UP-DOWN Counter (N-bit)  
## RTL:  
1. parameterized_counter.v    : RTL Implementation for N-bit parameterized Up-Down Counter with Enable and Direction control (increment/decrement).
  
## TB:  
1. parameterized_counter_tb.v : Testbench for N-bit parameterized Up-Down Counter to verify parameterized WIDTH, Increment/Decrement operation, enable and reset control.
  
## Truth Table
Parameterized Up-Down Counter (Only Rising clk edges)  
> WIDTH can be configurable(parameter) in testbench.

|  Rst  |  En  |  Dir  |    Count    |
|-------|------|-------|-------------|
|   1   |   X  |   X   |      0      |
|   0   |   0  |   X   |    Hold     |
|   0   |   1  |   0   |  Count - 1  |
|   0   |   1  |   1   |  Count + 1  |
