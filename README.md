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
* Simulated and verified using Icarus Verilog and GTKWave.

---

## 2. Synchronous FIFO

Buffers data within the same clock domain.

- 8-bit data storage.
- 8-depth FIFO memory.
- Synchronous read and write operations.
- Read and write pointer control.
- Full and empty flag logic.
- Inputs: `clk`, `rst`, `wr_en`, `rd_en`, `data_in`
- Outputs: `data_out`, `full`, `empty`
- Designed and verified using Vivado.

---


