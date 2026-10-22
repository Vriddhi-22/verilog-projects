# 6×1 Multiplexer Using 2×1 Multiplexers

## 📌 Overview
This project implements a **6×1 Multiplexer (MUX)** using five 2×1 multiplexers in Verilog HDL. The design is simulated using Icarus Verilog, and the output waveform is viewed using GTKWave.

## 🎯 Objective
To design and verify a 6×1 multiplexer using smaller 2×1 multiplexers through structural modeling in Verilog.

## ⚙️ Working Principle
A multiplexer selects one of several input signals and forwards the selected input to the output.

- **Inputs:** I0, I1, I2, I3, I4, I5
- **Select lines:** S0, S1, S2
- **Output:** Y
- **Components used:** Five 2×1 multiplexers

The select lines determine which input is routed to the output.

| Select Lines (S2 S1 S0) | Selected Input |
|---|---|
| 000 | I0 |
| 001 | I1 |
| 010 | I2 |
| 011 | I3 |
| 100 | I4 |
| 101 | I5 |

The combinations `110` and `111` are unused in this 6×1 MUX design.

## 🛠️ Tools Used
- Verilog HDL
- Visual Studio Code
- Icarus Verilog
- GTKWave

## ▶️ Simulation Steps

### 1. Compile the Verilog code
```powershell
iverilog -o mux_sim 6x1_using_2x1.v
```

### 2. Run the simulation
```powershell
vvp mux_sim
```

### 3. Open the waveform
```powershell
gtkwave mux6x1.vcd
```

## 📊 Waveform Verification
The testbench applies input values and changes the select lines to verify that the output `Y` follows the selected input.

The simulation generates a VCD waveform file named `mux6x1.vcd`, which can be opened in GTKWave.

## 📁 Project Files
- `6x1_using_2x1.v` — Verilog design and testbench
- `mux6x1.vcd` — Simulation waveform output
- `mux_sim` — Compiled simulation executable

## 📚 Key Learning Outcomes
- Understanding multiplexer operation
- Structural modeling in Verilog HDL
- Connecting smaller modules to build a larger circuit
- Writing a Verilog testbench
- Simulating and verifying digital circuits using Icarus Verilog and GTKWave

## 👩‍💻 Author
Created as a digital design and Verilog HDL learning project.
