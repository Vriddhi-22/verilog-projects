# 4-to-2 Encoder

## Aim
To design and simulate a 4-to-2 encoder using Verilog HDL.

## Description
A 4-to-2 encoder is a combinational circuit that converts four input lines into a 2-bit binary output. It assumes that only one input is HIGH at a time.

## Truth Table

| I3 | I2 | I1 | I0 | Y1 | Y0 |
|---|---|---|---|---|---|
| 0 | 0 | 0 | 1 | 0 | 0 |
| 0 | 0 | 1 | 0 | 0 | 1 |
| 0 | 1 | 0 | 0 | 1 | 0 |
| 1 | 0 | 0 | 0 | 1 | 1 |

## Verilog Design
The encoder is implemented using an `always @(*)` block and a `case` statement. The output represents the binary position of the active input.

## Testbench
The testbench applies all four valid one-hot input combinations with a delay of 10 ns between each test case. The waveform is generated using `$dumpfile` and `$dumpvars`.

## Simulation

```bash
iverilog -o encoder_sim encoder4x2.v
vvp encoder_sim
gtkwave encoder4x2.vcd
```

## GTKWave Signals
- `I3`, `I2`, `I1`, `I0`
- `Y1`, `Y0`

## Output
The active input is encoded into its corresponding 2-bit binary value.

## Result
The 4-to-2 encoder was successfully designed and simulated using Verilog