`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.12.2023 00:27:58
// Design Name: 
// Module Name: top
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


module top(clk,rst,newd,data_in,r,anode,cathode,tx_done,rx_done);
input clk,rst,newd,r;
input [7:0]data_in;
output tx_done,rx_done;
output [7:0]anode,cathode;

wire tmp_clk,tx,refclk,remclk;
wire [7:0]final,data_out;
wire [1:0]ref;
wire [3:0]sel;

ClkDiv des1(clk,rst,refclk,remclk);
uart des2(remclk,rst,newd,data_in,r,tx,tx_done,data_out,final,rx_done,tmp_clk);
RefreshCounter des3(refclk,rst,ref);
Selector des4(tx,final,ref,sel);
CathodeDisplay des5(sel,cathode);
AnodeDisplay des6(ref,anode);






















endmodule
