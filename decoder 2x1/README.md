# 1×2 Decoder Verilog Project

## Description

A 1×2 Decoder is a combinational circuit that converts a single binary input into one of two outputs. When the enable (`en`) input is high, only one output is activated based on the input value. When the enable input is low, all outputs remain low.

## Inputs

* a (Input)
* en (Enable)

## Outputs

* y0
* y1

## Boolean Expressions

y0 = en & ~a

y1 = en & a

## Truth Table

| en | a | y0 | y1 |
|----|---|----|----|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 0 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 1 |

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* VS Code

## Simulation Result

The design was verified using a Verilog testbench by applying all possible combinations of the enable and input signals. The outputs matched the expected truth table.