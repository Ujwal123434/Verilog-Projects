# 📦 Synchronous FIFO - Verilog HDL
This repository contains a Verilog HDL implementation and testbench for a Synchronous FIFO (First-In First-Out) memory buffer, widely used in digital systems for temporary data storage and data transfer between modules operating on the same clock.

---

## 📘 Description

This project implements a simple Synchronous FIFO (First In First Out) using Verilog HDL.

The FIFO stores 8-bit data and supports synchronous read and write operations using a common clock. It uses read and write pointers to manage data flow and provides status signals to indicate FIFO full and empty conditions.

---

## ✨ Features

* 8-bit data width
* 8-depth memory
* Synchronous read operation
* Synchronous write operation
* Full flag generation
* Empty flag generation
* Verilog testbench for simulation

---

## 🏗 FIFO Architecture

Components used:

* Memory Array (8 × 8-bit)
* Write Pointer
* Read Pointer
* Full Detection Logic
* Empty Detection Logic

---

## 🔌 Ports

| Signal        | Direction | Description          |
| ------------- | --------- | -------------------- |
| clk           | Input     | System clock         |
| rst           | Input     | Reset signal         |
| wr_en         | Input     | Write enable         |
| rd_en         | Input     | Read enable          |
| data_in[7:0]  | Input     | Input data           |
| data_out[7:0] | Output    | Output data          |
| full          | Output    | FIFO full indicator  |
| empty         | Output    | FIFO empty indicator |

---

## ⚙️ Working

### ✍️ Write Operation

When `wr_en` is high and FIFO is not full:

* Data is written into memory.
* Write pointer increments.

### 📤 Read Operation

When `rd_en` is high and FIFO is not empty:

* Data is read from memory.
* Read pointer increments.

### 📭 Empty Condition

```verilog
empty = (wr_ptr == rd_ptr);
```

### 📬 Full Condition

```verilog
full = ((wr_ptr + 1'b1) == rd_ptr);
```

---

## 📊 Simulation

The design was verified using a Verilog testbench.

### Example Sequence

1. Reset FIFO
2. Write data = 5
3. Write data = 10
4. Read first data → 5
5. Read second data → 10
6. FIFO becomes empty

---

## 📂 Project Structure

```text
Synchronous FIFO/
│
├── fifo.v
├── fifo_tb.v
├── top.v
├── mod_a.v
├── mod_b.v
└── README.md
```

---

## 🛠 Tools Used

* Verilog HDL
* Xilinx Vivado
* XSim Simulator

---
🎯 Applications
FPGA-Based Designs
Data Buffering
Communication Interfaces
Digital Signal Processing (DSP)
Embedded Systems
Network Packet Buffers

---

📚 Learning Outcomes

Through this project, the following concepts were explored:

FIFO Architecture
Memory Design in Verilog
Read and Write Pointer Management
Full and Empty Flag Generation
Sequential Logic Design
Functional Verification using Testbenches
Waveform Analysis and Debugging