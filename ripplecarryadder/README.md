# 4-Bit Ripple Carry Adder Using Full Adders

## 📌 Overview
This project implements a 4-bit Ripple Carry Adder (RCA) using four full adders in Verilog HDL. The circuit adds two 4-bit binary numbers along with a carry input and produces a 4-bit sum and a final carry output.

The design is simulated using Icarus Verilog, and the output waveforms are viewed using GTKWave.

## 🎯 Objective
To design and simulate a ripple carry adder using full adder modules connected in series.

## ⚙️ Working Principle
A ripple carry adder performs binary addition by connecting multiple full adders. The carry output of each full adder becomes the carry input of the next stage.

### Inputs and Outputs
- **A[3:0]:** First 4-bit binary input
- **B[3:0]:** Second 4-bit binary input
- **Cin:** Initial carry input
- **Sum[3:0]:** 4-bit sum output
- **Cout:** Final carry output

### Full Adder Equations

**Sum:**

`Sum = A XOR B XOR Cin`

**Carry output:**

`Cout = (A AND B) OR (A AND Cin) OR (B AND Cin)`

## 🏗️ Design Structure
The circuit contains four full adders connected in series:

1. **Full Adder 0:** Adds the least significant bits and `Cin`.
2. **Full Adder 1:** Adds the next bits and the carry from the first stage.
3. **Full Adder 2:** Adds the next bits and the carry from the second stage.
4. **Full Adder 3:** Adds the most significant bits and the carry from the third stage.

The carry propagates from one stage to the next, giving the circuit its name.

## 🛠️ Tools Used
- Verilog HDL
- Visual Studio Code
- Icarus Verilog
- GTKWave

## ▶️ Simulation Steps

### 1. Compile the design and testbench

```powershell
iverilog -o rca_sim ripple_carry_adder.v tb_ripple_carry_adder.v
```

### 2. Run the simulation

```powershell
vvp rca_sim
```

### 3. Open the waveform

```powershell
gtkwave ripple_carry_adder.vcd
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
The testbench applies different binary input combinations to verify the addition and carry propagation.

The simulation generates a VCD file named `ripple_carry_adder.vcd`, which can be opened in GTKWave. Signals can be displayed in binary format to make the results easier to understand.

## 📁 Project Files
- `ripple_carry_adder.v` — Ripple carry adder design and full adder module
- `tb_ripple_carry_adder.v` — Testbench
- `ripple_carry_adder.vcd` — Simulation waveform output
- `rca_sim` — Compiled simulation executable

## 📚 Key Learning Outcomes
- Understanding binary addition
- Designing a full adder in Verilog
- Connecting full adders to create a ripple carry adder
- Understanding carry propagation
- Writing and running a Verilog testbench
- Simulating digital circuits using Icarus Verilog
- Analyzing waveforms using GTKWave

## 👩‍💻 Author
Created as a digital design and Verilog HDL learning project.
