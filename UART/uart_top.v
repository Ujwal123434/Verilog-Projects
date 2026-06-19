`timescale 1ns / 1ps
module uart_top(
    input rst,
    input [7:0] data_in,
    input wr_enb,
    input clk,
    input rdy_clr,
    output rdy,
    output busy,
    output [7:0] data_out
);

wire baud_en;
wire tx;

baud_rate_generator bg(
    .clk(clk),
    .rst(rst),
    .tx_enb(baud_en),
    .rx_enb()
);

transmitter tx_inst(
    .clk(clk),
    .wr_en(wr_enb),
    .enb(baud_en),
    .rst(rst),
    .data_in(data_in),
    .tx(tx),
    .busy(busy)
);

receiver rx_inst(
    .clk(clk),
    .rst(rst),
    .rx(tx),
    .rdy_clr(rdy_clr),
    .clk_en(baud_en),
    .rdy(rdy),
    .data_out(data_out)
);

endmodule