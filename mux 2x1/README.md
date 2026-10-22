# 2×1 Multiplexer (MUX) Verilog Project

## Description

A 2×1 Multiplexer (MUX) is a combinational circuit that selects one of two 1-bit input signals based on the value of a select line and forwards the selected input to the output.

## Inputs

* i0 (Input 0)
* i1 (Input 1)
* sel (Select Line)

## Output

* y (Selected Output)

## Boolean Expression

y=(~sel&i0)|(sel&i1)

## Truth Table

| sel | i0 | i1 | y |
| --- | -- | -- | - |
| 0   | 0  | 0  | 0 |
| 0   | 0  | 1  | 0 |
| 0   | 1  | 0  | 1 |
| 0   | 1  | 1  | 1 |
| 1   | 0  | 0  | 0 |
| 1   | 0  | 1  | 1 |
| 1   | 1  | 0  | 0 |
| 1   | 1  | 1  | 1 |

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* VS Code

## Simulation Result

The design was verified using a Verilog testbench.
