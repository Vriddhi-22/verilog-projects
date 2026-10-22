# 1x2 Demultiplexer (DEMUX) using Verilog

## Description

This project implements a 1-to-2 Demultiplexer (DEMUX) using Verilog HDL.

A DEMUX routes a single input to one of several outputs based on the value of the select line. In a 1×2 DEMUX, the input data is directed to either `y0` or `y1` depending on the select signal `s0`.

## Block Diagram

```
        +-----------+
   a --->|           |---> y0
         | 1x2 DEMUX |
  s0 --->|           |---> y1
         +-----------+
```

## Truth Table

| a | s0 | y0 | y1 |
|---|----|----|----|
| 0 | 0  | 0  | 0  |
| 0 | 1  | 0  | 0  |
| 1 | 0  | 1  | 0  |
| 1 | 1  | 0  | 1  |

## Logic Equations

```
y0 = a · s0'
y1 = a · s0
```

## Verilog Module

```verilog
module demux_1_2(
    input a,
    input s0,
    output y0,
    output y1
);

assign y0 = a & ~s0;
assign y1 = a & s0;

endmodule
```

## Files

- `demux_1x2.v` – Verilog implementation of 1×2 DEMUX
- `demux_1_2_tb.v` – Testbench for simulation
- `demux_1x2.vcd` – Waveform file generated during simulation

## Simulation Steps

### Compile

```bash
iverilog -o demux demux_1x2.v demux_1_2_tb.v
```

### Run

```bash
vvp demux
```

### View Waveform

```bash
gtkwave demux_1x2.vcd
```

## Expected Output

```
a=0 s0=0 y0=0 y1=0
a=0 s0=1 y0=0 y1=0
a=1 s0=0 y0=1 y1=0
a=1 s0=1 y0=0 y1=1
```

## Applications

- Data Routing
- Communication Systems
- Memory Address Decoding
- Digital Switching Circuits
- Processor and Control Unit Design

