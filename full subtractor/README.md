# Full Subtractor Verilog Project

## Description

A Full Subtractor is a combinational circuit that subtracts two 1-bit binary numbers while considering a borrow input from the previous stage.

## Inputs

* A (Minuend)
* B (Subtrahend)
* Bin (Borrow In)

## Outputs

* Difference
* Borrow Out

## Boolean Expressions

Borrow=(~A&B)|(~A&Bin)|(B&Bin)
Difference=A^B^Bin

## Truth Table

| A | B | Bin | Difference | Borrow Out |
| - | - | --- | ---------- | ---------- |
| 0 | 0 | 0   | 0          | 0          |
| 0 | 0 | 1   | 1          | 1          |
| 0 | 1 | 0   | 1          | 1          |
| 0 | 1 | 1   | 0          | 1          |
| 1 | 0 | 0   | 1          | 0          |
| 1 | 0 | 1   | 0          | 0          |
| 1 | 1 | 0   | 0          | 0          |
| 1 | 1 | 1   | 1          | 1          |

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* VS Code

## Simulation Result

The design was verified using a Verilog testbench.
