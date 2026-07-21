`timescale 1ns / 1ps
module pc_puls4(
        input [31:0] fromPC,
       output [31:0] NextoPC
    );
 assign NextoPC = 4 +fromPC;
 
endmodule