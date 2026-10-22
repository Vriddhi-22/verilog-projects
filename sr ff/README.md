# SR Flip-Flop Using Verilog HDL

## 📌 Overview
This project implements a clocked SR (Set-Reset) flip-flop using Verilog HDL. The flip-flop stores one bit of data and updates its output based on the Set (`S`), Reset (`R`), and clock (`clk`) inputs.

The design is simulated using Icarus Verilog, and the waveforms are viewed using GTKWave.

## 🎯 Objective
To design and simulate a clocked SR flip-flop and understand how sequential circuits store and update data.

## ⚙️ Working Principle
An SR flip-flop has two control inputs:

- **S (Set):** Sets the output `Q` to 1.
- **R (Reset):** Resets the output `Q` to 0.
- **clk (Clock):** Controls when the output updates.
- **Q:** Stores the current state.
- **Qbar:** Complement of `Q`.

The output updates on the rising edge of the clock.

## 🧪 Truth Table

| S | R | Operation | Next State Q |
|---|---|---|---|
| 0 | 0 | Hold | Previous state |
| 0 | 1 | Reset | 0 |
| 1 | 0 | Set | 1 |
| 1 | 1 | Invalid | X |

**Note:** In this Verilog implementation, `S=1` and `R=1` assigns `X` to represent an invalid condition. This is a simulation model.

## 🛠️ Tools Used
- Verilog HDL
- Visual Studio Code
- Icarus Verilog
- GTKWave

## ▶️ Simulation Steps

### 1. Compile the design and testbench

```powershell
iverilog -o sr_sim sr_ff.v tb_sr_ff.v
```

### 2. Run the simulation

```powershell
vvp sr_sim
