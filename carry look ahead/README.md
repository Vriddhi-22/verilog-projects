# 4-Bit Carry Look-Ahead Adder (CLA) Using Verilog

## 📌 Overview
This project implements a 4-bit Carry Look-Ahead Adder (CLA) using Verilog HDL. Unlike a Ripple Carry Adder, which passes carry signals sequentially between stages, a Carry Look-Ahead Adder calculates carry signals using Boolean equations to reduce carry propagation delay.

The design is simulated using Icarus Verilog, and the output waveforms are viewed using GTKWave.

## 🎯 Objective
To design and simulate a 4-bit Carry Look-Ahead Adder that performs binary addition using propagate and generate signals.

## ⚙️ Working Principle

A Carry Look-Ahead Adder uses two important signals:

- **Propagate (P):** Determines whether an input bit pair propagates an incoming carry.
- **Generate (G):** Determines whether an input bit pair generates a carry.

### Boolean Equations

**Propagate:**

`P = A XOR B`

**Generate:**

`G = A AND B`

### Carry Equations

- `C1 = G0 + P0Cin`
- `C2 = G1 + P1G0 + P1P0Cin`
- `C3 = G2 + P2G1 + P2P1G0 + P2P1P0Cin`
- `Cout = G3 + P3G2 + P3P2G1 + P3P2P1G0 + P3P2P1P0Cin`

Here, `+` represents the OR operation, and multiplication represents the AND operation.

### Sum Equations

- `Sum0 = P0 XOR Cin`
- `Sum1 = P1 XOR C1`
- `Sum2 = P2 XOR C2`
- `Sum3 = P3 XOR C3`

## 🔌 Inputs and Outputs

- **A[3:0]:** First 4-bit binary input
- **B[3:0]:** Second 4-bit binary input
- **Cin:** Carry input
- **Sum[3:0]:** 4-bit sum output
- **Cout:** Final carry output

## 🛠️ Tools Used
- Verilog HDL
- Visual Studio Code
- Icarus Verilog
- GTKWave

## ▶️ Simulation Steps

### 1. Compile the design and testbench

```powershell
iverilog -o cla_sim carry_lookahead_adder.v tb_carry_lookahead_adder.v
```

### 2. Run the simulation

```powershell
vvp cla_sim
```

### 3. View the waveform

```powershell
gtkwave carry_lookahead_adder.vcd
```

## 🧪 Test Cases

| A | B | Cin | Sum | Cout |
|---|---|---|---|---|
| 0000 | 0000 | 0 | 0000 | 0 |
| 0011 | 0010 | 0 | 0101 | 0 |
| 0101 | 0011 | 0 | 1000 | 0 |
| 0111 | 0001 | 0 | 1000 | 0 |
| 1111 | 0001 | 0 | 0000 | 1 |
| 1010 | 0101 | 1 | 0000 | 1 |

## 📊 Waveform Verification
The testbench applies different input combinations to verify the sum and carry outputs.

The simulation generates a VCD file named `