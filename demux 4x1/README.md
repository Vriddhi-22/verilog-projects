# 1-to-4 Demultiplexer

## Aim
To design and simulate a 1-to-4 demultiplexer using Verilog HDL.

## Description
A 1-to-4 demultiplexer is a combinational circuit that takes one data input (`a`) and routes it to one of four outputs based on two select lines (`s1` and `s0`).

## Truth Table

| a | s1 | s0 | y0 | y1 | y2 | y3 |
|---|---|---|---|---|---|---|
| 0 | X | X | 0 | 0 | 0 | 0 |
| 1 | 0 | 0 | 1 | 0 | 0 | 0 |
| 1 | 0 | 1 | 0 | 1 | 0 | 0 |
| 1 | 1 | 0 | 0 | 0 | 1 | 0 |
| 1 | 1 | 1 | 0 | 0 | 0 | 1 |

## Verilog Design
The demultiplexer is implemented using continuous `assign` statements and bitwise logic operations.

## Testbench
The testbench applies different combinations of the data input and select lines. The `$monitor` statement displays the input and output values, while `$dumpfile` and `$dumpvars` generate the waveform file.

## Simulation

iverilog -o demux_sim demux_1x4.v
vvp demux_sim
gtkwave demux_1x4.v