# Synchronous FIFO (Verilog)

## Overview
A parameterized synchronous FIFO designed in Verilog HDL using a single clock for both read and write operations. The design supports configurable FIFO depth and data width with Full and Empty status flags.

## Features
- Parameterized FIFO Depth
- Parameterized Data Width
- Single Clock FIFO
- Active-Low Asynchronous Reset
- Full & Empty Detection
- Circular Buffer

## Parameters

| Parameter | Default |
|-----------|---------|
| FIFO_DEPTH | 8 |
| DATA_WIDTH | 32 |


## Pointer Logic

```verilog
localparam FIFO_DEPTH_LOG = $clog2(FIFO_DEPTH);
```

- Lower bits → Memory Address
- MSB → Wrap-around bit for Full detection

## Write Condition

```verilog
cs && wr_en && !full
```

## Read Condition

```verilog
cs && rd_en && !empty
```

## Empty Detection

```verilog
assign empty = (rd_ptr == wr_ptr);
```

## Full Detection

```verilog
assign full = (rd_ptr ==
              {~wr_ptr[FIFO_DEPTH_LOG],
               wr_ptr[FIFO_DEPTH_LOG-1:0]});
```

## Project Structure

```
├── syn_fifo.v
├── tb_syn_fifo.v
├── waveform.vcd
└── README.md
```



## Verification
- Reset Operation
- Write Operation
- Read Operation
- Full Condition
- Empty Condition
- Pointer Wrap-around

## Tools
- Verilog HDL
- Vivado 

## Applications
UART, SPI, I2C, DMA, Network Buffers, Processor Communication