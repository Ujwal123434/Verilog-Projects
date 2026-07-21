# Verilog-Projects

## 1. UART

Implements asynchronous serial communication between digital systems.

* Baud Rate Generator using configurable clock division.
* UART Transmitter (TX) FSM.
* UART Receiver (RX) FSM.
* Supports 8-bit data transmission.
* Start and Stop bit handling.
* Inputs: `clk`, `rst`, `tx_start`, `tx_data`, `rx`
* Outputs: `tx`, `rx_data`, `rx_done`, `busy`
* Design and simulated using Vivado

---

## 2. Synchronous FIFO

Buffers data within the same clock domain.

- Designed and implemented a parameterized synchronous FIFO in Verilog HDL.
- Supports configurable FIFO depth and data width using parameters.
- Implements synchronous read and write operations using a single clock.
- Designed read and write pointer logic with circular buffer architecture.
- Implemented Full and Empty flag generation using pointer comparison.
- Inputs: `clk`, `rst_n`, `cs`, `wr_en`, `rd_en`, `data_in`
- Outputs: `data_out`, `full`, `empty`
- Verified functionality through a self-checking testbench and simulation using Vivado

---


