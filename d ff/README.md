# D Flip-Flop Using Verilog

## Aim
To design and simulate a D Flip-Flop using Verilog HDL.

## Description
A D Flip-Flop is a sequential circuit that stores one bit of data. The output `Q` follows the input `D` at the rising edge of the clock. The output `Qbar` is the complement of `Q`.

## Truth Table

| Clock | D | Q (Next State) | Qbar |
|---|---|---|---|
| Rising edge | 0 | 0 | 1 |
| Rising edge | 1 | 1 | 0 |

## Verilog Design
The D Flip-Flop is implemented using a positive-edge-triggered `always` block.

```verilog
always @(posedge clk) begin
    Q <= D;
end
```

## Testbench
The testbench generates a clock signal and applies different values to input `D` to verify the flip-flop's operation.

## Simulation
The design is simulated using **Icarus Verilog** and the waveform is viewed using **GTKWave**.

```powershell
iverilog -o d_sim d_ff.v tb_d_ff.v
vvp .\d_sim
gtkwave d_ff.vcd
```

## Output
The waveform shows that `Q` updates to the value of `D` at each rising edge of the clock, while `Qbar` remains the complement of `Q`.

## Result
The D Flip-Flop was successfully designed and simulated using Verilog HDL.