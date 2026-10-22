# 8×1 Multiplexer Using 2×1 Multiplexers

## 📌 Overview
This project implements an **8×1 Multiplexer (MUX)** using seven 2×1 multiplexers in Verilog HDL. The design is simulated using Icarus Verilog, and the output waveform is viewed using GTKWave.

## 🎯 Objective
To design and verify an 8×1 multiplexer using smaller 2×1 multiplexers through structural modeling in Verilog HDL.

## ⚙️ Working Principle
A multiplexer selects one input from multiple input signals and forwards it to a single output based on the select lines.

- **Inputs:** I0, I1, I2, I3, I4, I5, I6, I7
- **Select lines:** S0, S1, S2
- **Output:** Y
- **Components used:** Seven 2×1 multiplexers

### Selection Table

| S2 | S1 | S0 | Selected Input |
|---|---|---|---|
| 0 | 0 | 0 | I0 |
| 0 | 0 | 1 | I1 |
| 0 | 1 | 0 | I2 |
| 0 | 1 | 1 | I3 |
| 1 | 0 | 0 | I4 |
| 1 | 0 | 1 | I5 |
| 1 | 1 | 0 | I6 |
| 1 | 1 | 1 | I7 |

## 🏗️ Design Structure

The design uses three stages:

- **Stage 1:** Four 2×1 MUXes select between pairs of inputs.
- **Stage 2:** Two 2×1 MUXes select between the outputs of Stage 1.
- **Stage 3:** One 2×1 MUX produces the final output.

**Total MUXes required:** 4 + 2 + 1 = 7

## 🛠️ Tools Used
- Verilog HDL
- Visual Studio Code
- Icarus Verilog
- GTKWave

## ▶️ Simulation Steps

### 1. Compile the Verilog code

```powershell
iverilog -o mux8_sim 8x1_using_2x1.v
```

### 2. Run the simulation

```powershell
vvp mux8_sim
```

### 3. View the waveform

```powershell
gtkwave mux8x1.vcd
```

## 📊 Waveform Verification
The testbench applies fixed input values and tests all eight select combinations, from `000` to `111`.

The output `Y` should match the selected input for each combination. The simulation generates `mux8x1.vcd`, which can be opened in GTKWave for waveform analysis.

## 📁 Project Files
- `8x1_using_2x1.v` — Verilog design and testbench, if both are saved in the same file
- `mux8x1.vcd` — Simulation waveform output
- `mux8_sim` — Compiled simulation executable

## 📚 Key Learning Outcomes
- Understanding 8×1 multiplexer operation
- Structural modeling using Verilog HDL
- Building larger digital circuits from smaller modules
- Writing and running a testbench
- Simulating digital circuits using Icarus Verilog
- Analyzing waveforms using GTKWave

## 👩‍💻 Author
Created as a digital design and Verilog HDL learning project.
