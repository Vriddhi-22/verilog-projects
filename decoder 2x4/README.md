# 2-to-4 Decoder

## Aim
To design and simulate a 2-to-4 decoder using Verilog HDL.

## Description
A 2-to-4 decoder is a combinational circuit with two input bits and four output lines. Based on the binary input, exactly one output becomes HIGH at a time.

## Truth Table

| I1 | I0 | a[3:0] |
|---|---|---|
| 0 | 0 | 0001 |
| 0 | 1 | 0010 |
| 1 | 0 | 0100 |
| 1 | 1 | 1000 |

## Verilog Design
The decoder is implemented using an `always @(*)` block and a `case` statement. The output `a` is declared as `reg` because it is assigned inside the procedural block.

## Testbench
The testbench applies all four possible input combinations, with a 10 ns delay between each test case.

## Simulation
Compile and run using Icarus Verilog:

```powershell
iverilog -s decoder2x4_tb -o decod_sim decoder2x