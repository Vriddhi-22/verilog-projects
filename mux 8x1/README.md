# 8×1 Multiplexer (MUX) Verilog Project

## Description

An 8×1 Multiplexer (MUX) is a combinational circuit that selects one of eight 1-bit input signals based on the values of three select lines and forwards the selected input to the output.

## Inputs

* i0 (Input 0)
* i1 (Input 1)
* i2 (Input 2)
* i3 (Input 3)
* i4 (Input 4)
* i5 (Input 5)
* i6 (Input 6)
* i7 (Input 7)
* s0 (Select Line 0)
* s1 (Select Line 1)
* s2 (Select Line 2)

## Output

* y (Selected Output)

## Boolean Expression

y=(~s0&~s1&~s2&i0)|
(~s0&~s1&s2&i1)|
(~s0&s1&~s2&i2)|
(~s0&s1&s2&i3)|
(s0&~s1&~s2&i4)|
(s0&~s1&s2&i5)|
(s0&s1&~s2&i6)|
(s0&s1&s2&i7)

## Truth Table

| s2 | s1 | s0 | Selected Input | y |
|----|----|----|----------------|---|
| 0 | 0 | 0 | i0 | i0 |
| 0 | 0 | 1 | i1 | i1 |
| 0 | 1 | 0 | i2 | i2 |
| 0 | 1 | 1 | i3 | i3 |
| 1 | 0 | 0 | i4 | i4 |
| 1 | 0 | 1 | i5 | i5 |
| 1 | 1 | 0 | i6 | i6 |
| 1 | 1 | 1 | i7 | i7 |

## Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* VS Code

## Simulation Result

The design was verified using a Verilog testbench by applying different combinations of the select lines and observing that the corresponding input was routed to the output.