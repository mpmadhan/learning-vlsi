# Parameterized UP-DOWN Counter (N-bit)  
## RTL:  
1. parameterized_counter.v    : RTL Code for N-bit parameterized Up/Down Counter
  
## TB:  
1. parameterized_counter_tb.v : Testbench for N-bit parameterized Up/Down Counter
  
## Truth Table
Parameterized Up-Down Counter (Only Rising clk edges)  
WIDTH: Can be customized in TB.

|  Rst  |  En  |  Dir  |    Count    |
|-------|------|-------|-------------|
|   1   |   X  |   X   | Count-prev  |
|   0   |   0  |   X   | Count-prev  |
|   0   |   1  |   0   |  Count - 1  |
|   0   |   1  |   1   |  Count + 1  |
