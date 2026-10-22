# 8-to-3 Priority Encoder using Verilog

## Aim
To design and simulate an 8-to-3 priority encoder using Verilog HDL.

## Description
An 8-to-3 priority encoder converts 8 input lines into a 3-bit binary output. When multiple inputs are HIGH, the input with the highest priority is encoded.

The priority order is from `I[7]` (highest priority) to `I[0]` (lowest priority).

The design uses the `casex` statement, where `x` bits in the case patterns act as don't-care bits.

## Priority Table

| Input Condition | Output `Y` |
|---|---|
| `1xxxxxxx` | `111` |
| `01xxxxxx` | `110` |
| `001xxxxx` | `101` |
| `0001xxxx` | `100` |
| `00001xxx` | `011` |
| `000001xx` | `010` |
| `0000001x` | `001` |
| `00000001` | `000` |
| `00000000` | `000` |

## Verilog Design
The design module is written in `encoder8x3.v`.

## Testbench
The testbench module is `encoder8x3_tb`. It tests individual inputs as well as multiple HIGH inputs to verify priority behavior.

The simulation generates a waveform file named `encoder8x3.vcd`.

## Simulation Commands

```bash
iverilog -o encoder_sim encoder8x3.v
vvp .\encoder_sim
gtkwave encoder8x3.vcd
```

## GTKWave Signals
- `I[7:0]` — Input lines
- `Y[2:0]` — Encoded binary output

## Expected Output
- When `I[0]` is HIGH, `Y = 000`.
- When `I[2]` and `I[5]` are HIGH, `Y = 101`.
- When `I[7]` is HIGH, `Y = 111`, regardless of other active inputs.
- When all inputs are LOW, `Y = 000`.

## Result
The 8-to-3 priority encoder was designed and simulated successfully using Verilog HDL.
