`timescale 1ns / 1ps
module baud_rate_generator(clk,rst,tx_enb,rx_enb);

input clk,rst;
output tx_enb,rx_enb;


reg [7:0] counter;

always @(posedge clk)
begin
    if(rst)
        counter <= 0;
    else if(counter == 5208)
        counter <= 0;
    else
        counter <= counter + 1'b1;
end

assign tx_enb = (counter == 0) ? 1'b1 : 1'b0;
assign rx_enb = (counter == 0) ? 1'b1 : 1'b0;

endmodule
