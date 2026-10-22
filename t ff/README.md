# T Flip-Flop Using Verilog

## Aim
To design and simulate a T Flip-Flop using Verilog HDL.

## Description
A T Flip-Flop is a sequential circuit that stores one bit of data. When `T = 0`, the output holds its previous state. When `T = 1`, the output toggles at every rising edge of the clock.

## Truth Table

| T | Present Q | Next Q |
|---|---|---|
| 0 | 0 | 0 (Hold) |
| 0 | 1 | 1 (Hold) |
| 1 | 0 | 1 (Toggle) |
| 1 | 1 | 0 (Toggle) |

## Verilog Design
The T Flip-Flop is implemented using a positive-edge-triggered `always` block.

```verilog
always @(posedge clk) begin
    if (T == 1'b1)
        Q <= ~Q;
    else
        Q <= Q;
end
```

## Testbench
The testbench generates a clock signal and applies different values to input `T` to verify the flip-flop's operation.

## Simulation
The design is simulated using **Icarus Verilog**, and the waveform is viewed using **GTKWave**.

```powershell
iverilog -o t_sim t_ff.v tb_t_ff.v
vvp .\t_sim
gtkwave t_ff.vcd
```

## Output
The waveform shows that `Q` holds its value when `T = 0` and toggles when `T = 1` at each rising edge of the clock. `Qbar` is the complement of `Q`.

## Result
The T Flip-Flop was successfully designed and simulated using Verilog HDL.