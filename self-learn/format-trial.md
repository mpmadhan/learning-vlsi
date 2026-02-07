# D-flipflop with No Reset
```verilog
module dff_no_reset(
    input clk,d,
    output q
);
    always @(posedge clk) begin
        q<=d;
    end
endmodule
```

# truthtable

| Inputs |   |Outputs |
|--------|---|--------|
|  clk   | d |   q    |
|   0    | 0 | q-prev |
|   0    | 1 | q-prev |
|   1    | 0 |   0    |
|   1    | 1 |   1    |


# D-flipflop with No Reset Testbench (dataflow model)

```verilog
module dff_no_reset_tb();

reg clk,d;
wire q;

dff_no_reset dut (.clk(clk),.d(d),.q(q));

initial begin
    clk=0;
    forever #5 clk=~clk;
end
endmodule

```

## Schematics
![Alt Text](https://i.ibb.co/hgQ01V1/FA.png)

## Simulation
![Alt Text](https://i.ibb.co/6BF4BMC/FA_Sim.png)
