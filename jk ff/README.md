# JK Flip-Flop Using Verilog HDL

## 📌 Overview
This project implements a clock-triggered JK Flip-Flop using Verilog HDL. A JK flip-flop is a sequential logic circuit that stores one bit of data and changes its output based on the J, K, and clock inputs.

The design is simulated using Icarus Verilog, and the waveforms are viewed using GTKWave.

## 🎯 Objective
To design and simulate a JK flip-flop and understand its hold, set, reset, and toggle operations.

## ⚙️ Working Principle
A JK flip-flop has two control inputs, J and K, and updates its output on the rising edge of the clock.

- **J:** Set input
- **K:** Reset input
- **clk:** Clock signal
- **Q:** Output
- **Qbar:** Complement of Q

## 🧪 Truth Table

| J | K | Operation | Next State Q |
|---|---|---|---|
| 0 | 0 | Hold | Previous state |
| 0 | 1 | Reset | 0 |
| 1 | 0 | Set | 1 |
| 1 | 1 | Toggle | Complement of previous state |

Unlike an SR flip-flop, the JK flip-flop has no invalid input combination in its standard truth table. When both J and K are high, the output toggles at the active clock edge.

## 🛠️ Tools Used
- Verilog HDL
- Visual Studio Code
- Icarus Verilog
- GTKWave

## ▶️ Simulation Steps

### 1. Compile the design and testbench

```powershell
iverilog -o jk_sim jk.v
```

### 2. Run the simulation

```powershell
vvp .\jk_sim
```

### 3. View the waveform

```powershell
gtkwave jk_ff.vcd
```

## 📊 Waveform Verification
The testbench applies different combinations of J and K to demonstrate the four operating modes: hold, reset, set, and toggle.

The simulation generates a VCD file named `jk_ff.vcd`, which can be opened in GTKWave to observe the clock, input signals, and output signals.

## 📁 Project Files
- `jk.v` — JK flip-flop design and testbench
- `jk_ff.vcd` — Simulation waveform output
