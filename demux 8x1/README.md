# 1-to-8 Demultiplexer

## Aim
To design and simulate a 1-to-8 demultiplexer using Verilog HDL.

## Description
A 1-to-8 demultiplexer is a combinational circuit that takes one data input (`a`) and routes it to one of eight outputs (`y0` to `y7`) using three select lines (`s2`, `s1`, and `s0`).

## Truth Table

| a | s2 | s1 | s0 | Active Output |
|---|---|---|---|---|
| 0 | X | X | X | None |
| 1 | 0 | 0 | 0 | y0 |
| 1 | 0 | 0 | 1 | y1 |
| 1 | 0 | 1 | 0 | y2 |
| 1 | 0 | 1 | 1 | y3 |
| 1 | 1 | 0 | 0 | y4 |
| 1 | 1 | 0 | 1 | y5 |
| 1 | 1 | 1 | 0 | y6 |
| 1 | 1 | 1 | 1 | y7 |

## Verilog Design
The demultiplexer is implemented using continuous `assign` statements and bitwise AND operations. Each output is controlled by the data input and the corresponding select-line combination.

## Testbench
The testbench applies all eight select-line combinations with the data input set to `1`. It also tests the condition where the data input is `0`. A delay of 10 ns is used between test cases, and `$dumpfile` and `$dumpvars` generate the waveform file.

## Simulation

```bash
iverilog -o demux_sim demux_1x8.v
vvp demux_sim
gtkwave demux_1x8.vcd
```

## GTKWave Signals
- `a`
- `s2`
- `s1`
- `s0`
- `y0`, `y1`, `y2`, `y3`
- `y4`, `y5`, `y6`, `y7`

## Output
When `a = 0`, all outputs remain LOW. When `a = 1`, only the output selected by `s2`, `s1`, and `s0` becomes HIGH.

## Result
The 1-to-8 demultiplexer was successfully designed and simulated using Verilog HDL. The expected output behavior was verified using GTKWave.
