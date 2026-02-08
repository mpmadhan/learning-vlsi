# Artifact-06: Synchronous reset D-Flipflop with Enable  
## RTL:  
1. dff_enable.v : Creating a Synchronous D-flipflop with Enable singal.  
## TB:  
1. dff_enable_tb.v : Testbench for Synchronous D-flipflop with Enable signal.

## Truth table
|Clk        | Enable | D | Q-next |
|-----------|--------|---|--------|
|Rising     | 0      | X | Q-prev |
|Rising     | 1      | 0 | 0      |
|Rising     | 1      | 1 | 1      |
|Falling,0,1| X      | X | Q-prev | 
