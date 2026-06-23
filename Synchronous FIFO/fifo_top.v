`timescale 1ns / 1ps
module fifo_top(
    input clk,
    input rst,
    input [7:0] data_top,
    output [7:0] data_out_top
);

wire [7:0] data_out_temp;
wire [7:0] data_out_fifo;
wire wr_en, rd_en;
wire full, empty;

mod_a mod1(
    data_top,
    clk,
    rst,
    data_out_temp,
    wr_en
);

fifo8 f1(
    clk,
    rst,
    wr_en,
    rd_en,
    data_out_temp,
    data_out_fifo,
    full,
    empty
);

mod_b mod2(
    clk,
    rst,
    data_out_fifo,
    data_out_top,
    rd_en
);

endmodule