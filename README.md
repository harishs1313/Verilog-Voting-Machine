# 🗳️ Verilog Voting Machine Project

This project implements a **simple digital voting machine** using **Verilog HDL**. The design includes three voting options: two candidates and a "null" vote, with long-press detection and an LED confirmation.

---

## 🔧 Features

- ⏱️ Requires 3-second button press to register a valid vote
- 👨‍💼 Button 1: Candidate 1 vote (`ctr1`)
- 👩‍💼 Button 2: Candidate 2 vote (`ctr2`)
- 🚫 Null vote (`ctr3`)
- 💡 LED blinks on valid vote
- 🛑 Synchronous reset support
- ✅ Testbench included with waveform dump support

---

## 📂 Files

| File | Description |
|------|-------------|
| `vm.v` | Main Verilog module (`vm`) for the voting logic |
| `vm_tb.v` | Testbench to simulate button presses and validate output |
| `voting.vcd` | Generated waveform (after simulation) for use with GTKWave |

---

## ⚙️ Simulation Instructions

> Tested with **Icarus Verilog** and **GTKWave**

### 1. Compile

```bash
iverilog -o voting.vvp vm.v vm_tb.v
````

### 2. Run Simulation

```bash
vvp voting.vvp
```

### 3. View Waveform

```bash
gtkwave voting.vcd
```

---

## 🔍 Waveform Signals to Observe

* `ctr1`, `ctr2`, `ctr3` – Vote counts
* `led` – Shows when a vote is successfully registered
* `button_1`, `button_2`, `null` – Inputs during test
* `clk`, `rst` – Clock and reset signals

---

## 🚀 Future Improvements (Ideas)

* Add debounce logic for real hardware buttons
* Interface with 7-segment displays or LCD for vote display
* Use a microcontroller or FPGA board for real-world demo
* Implement vote locking after a fixed number of users

---

## 📜 License

This project is licensed under the MIT License – feel free to use, modify, and share.

---

## 🤝 Contributions

Pull requests are welcome. For major changes, please open an issue first to discuss what you'd like to change or add.

---

## 🙋‍♂️ Author

**Harish**
*Developed as part of Verilog learning and simulation practice.*

### 🔍 Waveform Viewing

The waveform file (`voting.vcd`) is **not included** due to size limits.

To generate it yourself:

```bash
iverilog -o voting.vvp vm.v vm_tb.v
vvp voting.vvp
gtkwave voting.vcd
