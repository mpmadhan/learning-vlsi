# 1011 Mealy Sequence Detector (Overlapping)  
## RTL:  
1. mealy_1011_detector.v : RTL Code for detecting 1011 sequence using Mealy model.  
## TB:  
1. mealy_1011_detector_tb.v : Testbench for detecting 1011 sequence using Mealy model. (mealy_1011_detector.v).  

## State Encoding
| Current State | Encoding |
|---------------|----------|
| S0 - nothing  | 2'b00    |
| S1 - 1        | 2'b01    |
| S2 - 10       | 2'b10    |
| S3 - 101      | 2'b11    |
once input din = 1 after S3, detected(output) = high.  

## State Transition table
| Current State | Condition | Next State  |
|---------------|-----------|-------------|
| S0 - nothing  | din = 1   | S1 State    |
| S1 - 1        | din = 0   | S2 State    |
| S2 - 10       | din = 1   | S3 State    |
| S3 - 101      | din = 1   | detected = 1|

## Simulation
<img width="1836" height="258" alt="image" src="https://github.com/user-attachments/assets/b5e4b007-222a-4ee1-ba55-90a24011b385" />
