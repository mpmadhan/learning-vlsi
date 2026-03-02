#  TASK: 
## Build a circuit that has one 3-bit input, then outputs the same vector, and also splits it into three separate 1-bit outputs. Connect output o0 to the input vector's position 0, o1 to position 1, etc.  

<img width="500" height="400" alt="image" src="https://github.com/user-attachments/assets/4c4aa7f0-4812-47b1-a6b0-5f7347ea8e05" />

```verilog
module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  
);
    assign {o2,o1,o0} = vec;
    assign outv = vec;

endmodule
```
