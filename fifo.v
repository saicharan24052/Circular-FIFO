`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: fifo
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
/////////////////////////////////////////////////////////////////////////////////////////////////////// 
                                            //JK Filp Flop Based Counter 5bit
///////////////////////////////////////////////////////////////////////////////////////////////////////

module synchronous_5bit_counter (
  input clk, rst_n,
  input halt_counter,
  output  tog,
  output  [5:0] cnt // 3 bit counter and 1 bit at MSB is for wrap representation
);
  wire in3,in4,in5;
  wire q0, q0_bar, q1, q1_bar, q2, q2_bar,q3,q3_bar,q4,q4_bar;

reg k;
  JK_flipflop mod0(clk, rst_n,halt_counter, 1'b1, 1'b1, q0, q0_bar);
  JK_flipflop mod1(clk, rst_n,halt_counter, q0, q0, q1, q1_bar);
  JK_flipflop mod2(clk, rst_n,halt_counter, in3, in3, q2, q2_bar);
  
  JK_flipflop mod3(clk, rst_n,halt_counter, in4, in4, q3, q3_bar); 
  JK_flipflop mod4(clk, rst_n,halt_counter, in5, in5, q4, q4_bar); 
  
  
  always @(posedge clk) begin
    if(!rst_n) begin
      k <= 0;
    end
    
    else 
      if ({q4,q3,q2,q1,q0} == 5'b11111) begin
        k<=~k;           // toggling of k for every rotation
    end
    
    else 
      k <=k;
  end
 
 assign tog = k;
 assign in3 = q0 & q1;
  assign in4 = (q0 & q1) & (q2);
  assign in5 = (q0 & q1) & (q2) & (q3);
  assign  cnt = {q4,q3,q2,q1,q0}; 
endmodule
         

/////////////////////////////////////////////////////////////////////////////////////////////////////// 
                                            //JK Filp Flop
///////////////////////////////////////////////////////////////////////////////////////////////////////
         
module JK_flipflop (
  input clk, rst_n,
  input halt_jk,
  input j, k,
  output reg q,
  output q_bar
  );
  
  
  always@(posedge clk) begin 
    if(!rst_n) q <= 0;
    else if(halt_jk) begin
       q <= q;
       
       end
       else begin
      case({j, k})
        2'b00: q <= q;    // No change
        2'b01: q <= 1'b0; // reset
        2'b10: q <= 1'b1; // set
        2'b11: q <= ~q;   // Toggle
      endcase
    end
  end
  
  assign q_bar = ~q;
endmodule

/////////////////////////////////////////////////////////////////////////////////////////////////////// 
                                            //Circular FIFO 
///////////////////////////////////////////////////////////////////////////////////////////////////////

module fifo(w_clk,r_clk,reset_n,w_en,r_en,data_in,data_out,FULL,EMPTY);  
input [7:0] data_in;   
output reg [7:0] data_out;
input w_clk,r_clk,reset_n,w_en,r_en;  
output FULL,EMPTY;
 

reg [7:0] mem [0:31];
wire [4:0]w_addr,r_addr; // MSB represent wraping
 reg [4:0] addr_1; 
 wire tog_w,tog_r;  // Toggling bits for write and read
 reg [7:0]temp_data_in;
 reg halt_w,halt_r;
 reg FULL_temp,FULL_temp2;
 reg FULL_temp3;
 reg test;


    always @(*) begin   // combinational 
        if(((w_addr ) == (r_addr )) && (tog_w != tog_r)) begin //{tog_r,tog_w} < 2'b10) &&
            FULL_temp = 1'b1;// this is important but lackes stable data w.r.t w _clk
        end
        else begin
            FULL_temp = 1'b0;
        end
    end



	always @(posedge w_clk) begin        //sequential
		if(!reset_n) begin
			FULL_temp2 <=1'b0;
  		end
		else begin
			FULL_temp2 <=FULL_temp;// converts FULL_temp from comb to to seq , this block reacts according to w_clk it is benifitaial(important)
		end
	end

		always @(*) begin // conversion of FULL_temp2 from seq to comb :so data retrives immediatly ,unlike seq : data appears in next state and OR operation for correct FULL status
		FULL_temp3 = FULL_temp || FULL_temp2; 
		if(FULL_temp3) begin
  			halt_w = 1'b1; // genearlly halt = 1, halts the counter
		end
		else
			halt_w = 1'b0; // genearlly halt = 0, halts the counter
		end

  synchronous_5bit_counter counter0(w_clk, reset_n,halt_w,tog_w,w_addr); 
  synchronous_5bit_counter counter1(r_clk, reset_n,halt_r,tog_r,r_addr);
  
  assign FULL =    FULL_temp; 
  assign EMPTY =  (tog_w == tog_r) && (r_addr == w_addr);  

    // To write data to FIFO
        always @(posedge w_clk) begin
            if(!reset_n) begin
            mem[0]  <= 8'b00000000;
            mem[1]  <= 8'b00000000;
            mem[2]  <= 8'b00000000;
            mem[3]  <= 8'b00000000;
            mem[4]  <= 8'b00000000;
            mem[5]  <= 8'b00000000;
            mem[6]  <= 8'b00000000;
            mem[7]  <= 8'b00000000;
            mem[8]  <= 8'b00000000;
            mem[9]  <= 8'b00000000;
            mem[10] <= 8'b00000000;
            mem[11] <= 8'b00000000;
            mem[12] <= 8'b00000000;
            mem[13] <= 8'b00000000;
            mem[14] <= 8'b00000000;
            mem[15] <= 8'b00000000;
            mem[16] <= 8'b00000000;
            mem[17] <= 8'b00000000;
            mem[18] <= 8'b00000000;
            mem[19] <= 8'b00000000;
            mem[20] <= 8'b00000000;
            mem[21] <= 8'b00000000;
            mem[22] <= 8'b00000000;
            mem[23] <= 8'b00000000;
            mem[24] <= 8'b00000000;
            mem[25] <= 8'b00000000;
            mem[26] <= 8'b00000000;
            mem[27] <= 8'b00000000;
            mem[28] <= 8'b00000000;
            mem[29] <= 8'b00000000;
            mem[30] <= 8'b00000000;
            mem[31] <= 8'b00000000;
            halt_w <=1'b0;
            end    
            else if (w_en & !FULL_temp3) begin
                mem[w_addr] <= data_in;  // Ensure addr gets updated in the right condition
            end 
            else begin     
  				 temp_data_in <=  8'b0;
            end
		end
  
  // To read data from FIFO
        always @(posedge r_clk) begin  
            if (!reset_n) begin  
              data_out <=8'b0;
             halt_r <= 1'b0;
            end  
            else if (r_en & !EMPTY ) begin 
                 data_out <= mem[r_addr];  // Read from memory
             halt_r <= 1'b0;
            end 
            else begin
             halt_r <= 1'b1;
            data_out <= 8'b0; 
            end
		end

endmodule
 
   
 
