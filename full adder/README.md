# Full Adder Verilog Project

## Description
A Full Adder is a combinational digital circuit that adds three binary inputs:
- A
- B
- Carry Input (Cin)

It produces two outputs:
- Sum
- Carry Output (Carry)

## Logic Equations

### Sum

Sum = A ^ B ^ Cin


### Carry

Carry = (A & B) | (B & Cin) | (A & Cin)


## Truth Table

| A | B | Cin | Sum | Carry |
|---|---|-----|-----|-------|
| 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 | 0 |
| 0 | 1 | 0 | 1 | 0 |
| 0 | 1 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 | 0 |
| 1 | 0 | 1 | 0 | 1 |
| 1 | 1 | 0 | 0 | 1 |
| 1 | 1 | 1 | 1 | 1 |

## Files

- `full_adder.v` - Verilog design and testbench
- `README.md` - Project documentation

## Tools Used

- Verilog HDL
- VS Code
- Icarus Verilog
- GTKWave

## Simulation

The Full Adder was verified using a Verilog testbench.

All 8 possible input combinations were tested and the output was checked using simulation.

## Author

Digital Design Practice Project
