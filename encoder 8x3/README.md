# 8-to-3 Encoder

## Aim
To design and simulate an 8-to-3 encoder using Verilog HDL.

## Description
An 8-to-3 encoder is a combinational circuit that converts eight input lines into a 3-bit binary output. It assumes that only one input is HIGH at a time.

## Truth Table

| I7 | I6 | I5 | I4 | I3 | I2 | I1 | I0 | Y2 | Y1 | Y0 |
|---|---|---|---|---|---|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 1 |
| 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 1 | 0 |
| 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 1 | 1 |
| 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 1 | 0 | 0 |
| 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 1 |
| 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 1 |

## Verilog Design
The encoder is implemented using an `always @(*)` block and a `case` statement. The output represents the binary position of the active input.

## Testbench
The testbench applies all eight valid one-hot input combinations with a delay of 10 ns between each test case. The waveform is generated using `$dumpfile` and `$dumpvars`.

## Simulation

```bash
iverilog -o encoder_sim encoder8x3.v
vvp encoder_sim
gtkwave encoder8x3.vcd
```

## GTKWave Signals
- `I[7:0]`
- `Y[2:0]`

## Output
The active input is encoded into its corresponding 3-bit binary value.

## Result
The 8-to-3 encoder was successfully designed and simulated using Verilog HDL. The output was verified using GTKWave.
