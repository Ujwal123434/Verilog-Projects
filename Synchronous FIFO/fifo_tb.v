`timescale 1ns / 1ps
module fifo_tb;

reg clk,rst;
reg [7:0] data_in;
wire [7:0] data_out;


fifo_top dut(clk,rst,data_in,data_out);

initial begin 
   {clk,rst,data_in} = 0;
end
 
always #5 clk = ~clk;


initial begin

rst = 1;
#10;
rst = 0;
data_in = 5;
#10;
data_in = 10;
#10;
data_in = 50;
#10;
$finish;
end
endmodule