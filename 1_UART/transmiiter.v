`timescale 1ns / 1ps
module transmitter(clk,wr_en,enb,rst,data_in,tx,busy);

input clk;
input wr_en;
input enb;
input rst;
input [7:0] data_in;

output reg tx;
output busy;

parameter IDLE  = 2'b00;
parameter START = 2'b01;
parameter DATA  = 2'b10;
parameter STOP  = 2'b11;

reg [1:0] state;
reg [7:0] data;
reg [2:0] index;

always @(posedge clk)
begin
    if(rst)
    begin
        state <= IDLE;
        tx <= 1'b1;
        index <= 0;
        data <= 0;
    end
    else
    begin
        case(state)

            IDLE:
            begin
                tx <= 1'b1;
                if(wr_en)
                begin
                    data <= data_in;
                    index <= 0;
                    state <= START;
                end
            end

            START:
            begin
                if(enb)
                begin
                    tx <= 1'b0;
                    state <= DATA;
                end
            end

            DATA:
            begin
                if(enb)
                begin
                    tx <= data[index];

                    if(index == 3'd7)
                        state <= STOP;
                    else
                        index <= index + 1'b1;
                end
            end

            STOP:
            begin
                if(enb)
                begin
                    tx <= 1'b1;
                    state <= IDLE;
                end
            end

            default:
            begin
                tx <= 1'b1;
                state <= IDLE;
            end

        endcase
    end
end
endmodule