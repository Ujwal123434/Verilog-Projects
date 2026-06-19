`timescale 1ns / 1ps
module urat_top_tb;

reg clk;
reg rst;
reg wr_en;
reg rdy_clr;
reg [7:0] data_in;

wire rdy;
wire busy;
wire [7:0] dout;

uart_top dut( rst,data_in,wr_en,clk,rdy_clr,rdy,busy,dout);

initial
begin
    clk     = 0;
    rst     = 0;
    wr_en   = 0;
    rdy_clr = 0;
    data_in = 0;
end

always #5 clk = ~clk;

task send_byte;
input [7:0] din;
begin
    @(negedge clk);
    data_in = din;
    wr_en   = 1'b1;

    @(negedge clk);
    wr_en   = 1'b0;
end
endtask

task clear_ready;
begin
    @(negedge clk);
    rdy_clr = 1'b1;

    @(negedge clk);
    rdy_clr = 1'b0;
end
endtask

initial
begin

    // Apply Reset
    rst = 1'b1;

    repeat(5) @(negedge clk);

    rst = 1'b0;

    repeat(5) @(negedge clk);

    // Send 41
    send_byte(8'h41);

    wait(!busy);
    wait(rdy);

    $display("Received data = %h", dout);

    clear_ready;

    repeat(20) @(negedge clk);

    // Send 55
    send_byte(8'h55);

    wait(!busy);
    wait(rdy);

    $display("Received data = %h", dout);

    clear_ready;

    #100000;

    $finish;

end

endmodule