`timescale 1ns / 1ps
module mod_b(
    input clk,rst,input [7:0] data_in,output reg [7:0] data_out,output reg rd_en
    );
    
    parameter idle = 2'b00;
    parameter s1 = 2'b01;
    parameter data_state = 2'b10;
    
    reg [1:0] ps,ns;
    
    always@(posedge clk)
        begin
          if(rst)  
            begin
               ps <=idle;
            end
          else
               ps <= ns;
        end
       
     always@(*) 
        begin 
          case(ps)
            idle : begin
               ns <= s1;
               rd_en <= 0;
               end
               
             s1  : begin
                ns <= data_state;
                end
                
             data_state : begin
                  ns <= idle;
                  rd_en <= 1;
                  data_out <= data_in;
                  end
                  
             endcase
          
         end
         
endmodule
