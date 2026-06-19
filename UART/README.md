# UART Verilog Implementation

This repository contains a Verilog HDL implementation and testbench for a UART (Universal Asynchronous Receiver/Transmitter), a widely used protocol for asynchronous serial communication between digital devices.

---

## 📘 Description

UART enables serial communication without requiring a shared clock signal between transmitter and receiver.

### UART Frame Format

```text
| Start Bit | Data Bits (8-bit) | Stop Bit |
|     0     |      D0-D7        |     1    |
```

Transmission sequence:

* Start Bit → `0`
* Data Bits → `8-bit data (LSB first)`
* Stop Bit → `1`

This project consists of three major modules:

1. **Baud Rate Generator**
2. **UART Transmitter (TX)**
3. **UART Receiver (RX)**

---

## 💡 Modules & Features

### 1. Baud Rate Generator

Generates timing tick signals required for UART transmission and reception.

#### Features

* Configurable baud rate
* Generates baud tick pulses
* Supports 16× oversampling for reliable data reception
* Parameterized design

#### Parameters

| Parameter | Description                 |
| --------- | --------------------------- |
| freq      | System Clock Frequency (Hz) |
| baud      | UART Baud Rate (bps)        |

#### Formula

```text
Baud Tick Count = freq / (baud × 16)
```

---

### 2. UART Transmitter (TX)

Finite State Machine (FSM) based transmitter that converts parallel data into serial format.

#### FSM States

| State | Description                 | TX Output | Busy |
| ----- | --------------------------- | --------- | ---- |
| IDLE  | Wait for transmit request   | 1         | 0    |
| START | Transmit start bit          | 0         | 1    |
| DATA  | Send 8-bit data (LSB first) | Data Bit  | 1    |
| STOP  | Transmit stop bit           | 1         | 0    |

#### Features

* 8-bit data transmission
* LSB-first shifting
* Start and stop bit generation
* Busy signal indication
* FSM-based implementation

---

### 3. UART Receiver (RX)

Finite State Machine (FSM) based receiver that converts serial data into parallel format.

#### FSM States

| State | Description         | Action              | Busy | rx_done |
| ----- | ------------------- | ------------------- | ---- | ------- |
| IDLE  | Wait for start bit  | Detect falling edge | 0    | 0       |
| START | Validate start bit  | Sample at mid-bit   | 1    | 0       |
| DATA  | Receive 8 data bits | Shift into register | 1    | 0       |
| STOP  | Validate stop bit   | Store received data | 0    | 1       |

#### Features

* Start bit detection
* 16× oversampling
* 8-bit data reception
* Stop bit verification
* Data valid indication (`rx_done`)
* FSM-based implementation

---

## 📂 Project Structure

```text
UART/
│
├── uart_top.v
├── baudrate.v
├── transmitter.v
├── receiver.v
├── uart_top_tb.v
├── waveform.png
|── schematic.png
└── README.md
```

---

## 🛠 Tools Used

* Verilog HDL
* Vivado (Optional)

---


## 📊 Expected Waveform

```text
TX Line

Idle   Start     Data(8-bit)      Stop
 1 -----0-----10100101------1-----
```

---

## 🎯 Applications

* FPGA Communication Systems
* Embedded Systems
* Microcontroller Interfaces
* Sensor Data Acquisition
* Serial Debugging

---

## 📚 Learning Outcomes

Through this project, the following concepts were explored:

* UART Communication Protocol
* Finite State Machine (FSM) Design
* Serial Data Transmission
* Serial Data Reception
* Baud Rate Generation
* Functional Verification using Testbenches
* Waveform Analysis

---



