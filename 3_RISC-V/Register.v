`timescale 1ns / 1ps
module Register(
       input clk,rst,RegWrite,
       input [4:0] Rs1, Rs2, Rd,
       input [31:0] Write_data,
       output [31:0] read_data1, read_data2
    );
    
    integer k;
    reg [31:0] Registers [31:0];
    
    always@(posedge clk) begin
      if(rst) begin
         for( k=0; k<32; k=k+1)
         Registers[k] <=32'b00;
      end
   
    else if(RegWrite) begin 
     Registers[Rd] <= Write_data; 
    end  
  end  
endmodule