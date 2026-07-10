`timescale 1ns / 1ps
module receiver(clk,rst,rx,rdy_clr,clk_en,rdy,data_out);

input clk;
input rst;
input rx;
input rdy_clr;
input clk_en;

output reg rdy;
output reg [7:0] data_out;

parameter IDLE = 2'b00;
parameter DATA = 2'b01;
parameter STOP = 2'b10;

reg [1:0] state;
reg [2:0] index;
reg [7:0] temp_reg;

always @(posedge clk)
begin
    if(rst)
    begin
        state <= IDLE;
        index <= 0;
        temp_reg <= 0;
        data_out <= 0;
        rdy <= 0;
    end
    else
    begin
        if(rdy_clr)
            rdy <= 0;

        if(clk_en)
        begin
            case(state)

                IDLE:
                begin
                    if(rx == 1'b0)
                    begin
                        index <= 0;
                        state <= DATA;
                    end
                end

                DATA:
                begin
                    temp_reg[index] <= rx;

                    if(index == 3'd7)
                        state <= STOP;
                    else
                        index <= index + 1'b1;
                end

                STOP:
                begin
                    data_out <= temp_reg;
                    rdy <= 1'b1;
                    state <= IDLE;
                end

                default:
                begin
                    state <= IDLE;
                end

            endcase
        end
    end
end

endmodule