# Half Subtractor Verilog Project

## Description

A Half Subtractor is a combinational circuit that subtracts one 1-bit binary input from another 1-bit binary input.

## Inputs

* A (Minuend)
* B (Subtrahend)

## Outputs

* Difference
* Borrow

## Truth Table

| A | B | Difference | Borrow |
| - | - | ---------- | ------ |
| 0 | 0 | 0          | 0      |
| 0 | 1 | 1          | 1      |
| 1 | 0 | 1          | 0      |
| 1 | 1 | 0          | 0      |

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* VS Code

## Simulation Result

The design was verified using a Verilog testbench.
