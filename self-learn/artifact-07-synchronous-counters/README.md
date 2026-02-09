# 4-Bit Synchronous UP/Down/Up-Down Counters  
## RTL:  
1.up_counter.v      : RTL Code for 4-bit synchronous UP Counter with Enable.  
2.down_counter.v    : RTL Code for 4-bit synchronous Down Counter with Enable.  
3.up_down_counter.v : RTL Code for 4-bit synchronous UP-Down Counter with Enable.  
## TB:
1.up_counter_tb.v       : Testbench for 4-bit synchronous UP Counter with Enable.
2.down_counter_tb.v     : Testbench for 4-bit synchronous Down Counter with Enable.
3.up_down_counter_tb.v  : Testbench for 4-bit synchronous UP-Down Counter with Enable.

# Truth table
## 1. Up counter (Only on Clk Rising edge)
| Rst |  En |   Count    |
|-----|-----|------------|
|  1  |  X  |    0       |
|  0  |  0  | Count-prev |
|  0  |  1  | Count + 1  |  
  
## 2. Down counter (Only on Clk Rising edge)
| Rst |  En |   Count    |
|-----|-----|------------|
|  1  |  X  |    0       |
|  0  |  0  | Count-prev |
|  0  |  1  | Count - 1  |  
  
## 3. Up-Down counter (Only on Clk Rising edge)
| Rst |  En |  UpDown  |   Count    |
|-----|-----|----------|------------|
|  1  |  X  |    X     |    0       |
|  0  |  0  |    X     | Count-prev |
|  0  |  1  |    0     | Count - 1  |
|  0  |  1  |    1     | Count + 1  |
