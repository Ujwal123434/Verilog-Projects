`timescale 1ns / 1ps

module tb_syn_fifo;

parameter FIFO_DEPTH = 8;
parameter DATA_WIDTH = 32;
reg clk = 0;
reg rst_n,cs,wr_en,rd_en;
reg [DATA_WIDTH-1:0] data_in;
wire[DATA_WIDTH-1:0] data_out;
wire empty,full;

syn_fifo #(.FIFO_DEPTH(FIFO_DEPTH),
           .DATA_WIDTH(DATA_WIDTH))
           
       dut(.clk(clk),
           .rst_n(rst_n),
           .cs(cs),
           .wr_en(wr_en),
           .rd_en(rd_en),
           .data_in(data_in),
           .data_out(data_out),
           .empty(empty),
           .full(full));
           
  always begin  #5 clk = ~clk; end
  
 task write_data(input [DATA_WIDTH-1:0] data);
begin
    @(posedge clk);
    cs      = 1;
    wr_en   = 1;
    data_in = data;

    @(posedge clk);
    wr_en = 0;
end
endtask


task read_data;
begin
    @(posedge clk);
    cs    = 1;
    rd_en = 1;

    @(posedge clk);
    rd_en = 0;
end
endtask  
     
    initial begin 
    #1;
    rst_n = 0; rd_en = 0; wr_en = 0;
    
    @(posedge clk)   
      rst_n = 1;
      write_data(5);
      write_data(10);
      write_data(50);
      
      
      read_data();
      read_data();
      read_data();
      
      #40 $finish;
   
    end
       
endmodule