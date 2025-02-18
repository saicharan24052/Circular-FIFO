`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: fifo_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fifo_tb;

logic [7:0] data_in,data_out;
  logic w_clk,r_clk,reset_n,w_en,r_en;  
logic FULL,EMPTY;
  
  fifo modfifo(w_clk,r_clk,reset_n,w_en,r_en,data_in,data_out,FULL,EMPTY); 
  
  initial begin
    w_clk = 0;
    r_clk = 0;
    reset_n = 0; 
    w_en = 1;
    r_en = 1;
    #5; reset_n = 1;

  end
  
  always #1 w_clk = ~w_clk;
    always #2 r_clk = ~r_clk;
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
  end
  
  
  initial @(posedge w_clk) begin
    
   #4;

   data_in =  $urandom();
   #2;
   data_in =  $urandom();
   #2;
   data_in =  $urandom();
   #2;
   data_in =  $urandom();
   #2;
   data_in =  $urandom();
   #2;
   data_in =  $urandom();
   #2;
   data_in =  $urandom();
   #2;
   data_in =  $urandom();
   #2;
   data_in =  $urandom();
   #2;
   data_in =  $urandom();
   #2;
   data_in =  $urandom();
   #2;
   data_in =  $urandom();
   #2;
   data_in =  $urandom();
   #2;
   data_in =  $urandom();
   #2;
   data_in =  $urandom();
   #2;
   data_in =  $urandom();


#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
#2;
data_in =  $urandom();
    
    
    
    
    #67;
    $stop;
  end
    
endmodule
