`timescale 1ns / 1ps
module Instruction_memory(
       input clk,rst,
       input [31:0] read_address,
       output reg [31:0] instruction_out
    );
    
    integer k;
    reg [31:0] I_Mem [63:0];
    
    always@(posedge clk) begin 
       if(rst) begin
          for(k = 0; k < 64; k = k+1)
          I_Mem[k] <= 32'b00;
       end
       else
           instruction_out <= I_Mem[read_address];
    
       end

endmodule