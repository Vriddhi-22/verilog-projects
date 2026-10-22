# 4×1 Multiplexer (MUX) Verilog Project

## Description

A 4×1 Multiplexer (MUX) is a combinational circuit that selects one of four 1-bit input signals based on the values of two select lines and forwards the selected input to the output.

## Inputs

* i0 (Input 0)
* i1 (Input 1)
* i2 (Input 2)
* i3 (Input 3)
* s0 (Select Line 0)
* s1 (Select Line 1)

## Output

* y (Selected Output)

## Boolean Expression

y=(~s1&~s0&i0)|(~s1&s0&i1)|(s1&~s0&i2)|(s1&s0&i3)

## Truth Table

| s1 | s0 | Selected Input | y  |
| -- | -- | -------------- | -- |
| 0  | 0  | i0             | i0 |
| 0  | 1  | i1             | i1 |
| 1  | 0  | i2             | i2 |
| 1  | 1  | i3             | i3 |

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* VS Code

## Simulation Result

The design was verified using a Verilog testbench by applying different combinations of the select lines and observing that the corresponding input was routed to the output.
