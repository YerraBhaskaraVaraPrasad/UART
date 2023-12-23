`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2023 15:36:15
// Design Name: 
// Module Name: uart
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


module uart #(parameter freq=450_000_000, parameter baudrate=9600)(clk,rst,newd,data_in,r,tx,tx_done,data_out,final,rx_done,tmp_clk);
input clk,rst,newd,r;
input [7:0]data_in;
output tx,tx_done,rx_done,tmp_clk;
output [7:0]data_out,final;

ClkDiv #(freq,baudrate) des1(clk,rst,tmp_clk);
tx des2(clk,rst,newd,data_in,tx,tx_done);
rx des3(clk,rst,r,data_out,rx_done,final);



















endmodule
