# 2x1 Encoder using Verilog

## Description

This project implements a 2-to-1 Encoder with an Enable input using Verilog HDL.

An encoder converts active input lines into their corresponding binary code. In a 2×1 encoder, there are two inputs (`i0`, `i1`) and one output (`y`). When the Enable signal is HIGH, the output represents the binary code of the active input.

## Truth Table

| en | i1 | i0 | y |
|----|----|----|---|
| 0  | X  | X  | 0 |
| 1  | 0  | 1  | 0 |
| 1  | 1  | 0  | 1 |

**Note:** Only one input should be HIGH at a time.

## Logic Equation

```
y = en · i1
```

## Verilog Module

```verilog
module encoder(
    input i0,
    input i1,
    input en,
    output y
);

assign y = en & i1;

endmodule
```

## Files

- `encoder.v` – Encoder module
- `encoder_testbench.v` – Testbench for simulation
- `encoder_2x1.vcd` – Waveform file generated during simulation

## Simulation Steps

### Compile

```bash
iverilog -o encoder encoder.v
```

### Run

```bash
vvp encoder
```

### View Waveform

```bash
gtkwave encoder_2x1.vcd
```

## Expected Results

| en | i1 | i0 | y |
|----|----|----|---|
| 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 1 |

## Applications

- Data Encoding
- Digital Communication Systems
- Code Conversion Circuits
- Processor Control Units
- Digital Logic Design

