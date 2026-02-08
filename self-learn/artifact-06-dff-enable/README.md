# Artifact-06: Synchronous reset D-Flipflop with Enable  
## RTL:  
1. dff_enable.v : Creating a synchronous d-flipflop with enable singal.  
## TB:  
1. dff_enable_tb.v : Testbench for synchronous d-flipflop with enable signal.

## Truth table
|Clk        | enable | D | Q-next |
|-----------|--------|---|--------|
|rising     | 0      | X | Q-prev |
|rising     | 1      | 0 | 0      |
|rising     | 1      | 1 | 1      |
|falling,0,1| X      | X | Q-prev | 
