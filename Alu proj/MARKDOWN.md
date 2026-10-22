# 4-Bit ALU Using Verilog

## Aim
To design and simulate a 4-bit Arithmetic Logic Unit (ALU) using Verilog HDL.

## Description
An Arithmetic Logic Unit (ALU) is a digital circuit that performs arithmetic and logical operations on binary inputs. This project uses a `case` statement to select the required operation based on the 3-bit selection input `sel`.

## Operations Table

| Select (`sel`) | Operation | Output |
|---|---|---|
| 000 | Addition | A + B |
| 