`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2023 23:56:53
// Design Name: 
// Module Name: CathodeDisplay
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


module CathodeDisplay(sel,cathode);
input [0:3]sel;
output reg [0:7]cathode;
always@*
begin
case(sel)
0: cathode=8'h03;
1: cathode=8'h9f;
2: cathode=8'h25;
3: cathode=8'h0d;
4: cathode=8'h99;
5: cathode=8'h49;
6: cathode=8'h41;
7: cathode=8'h1f;
8: cathode=8'h01;
9: cathode=8'h09;
10: cathode=8'h05;
11: cathode=8'hc1;
12: cathode=8'h63;
13: cathode=8'h85;
14: cathode=8'h21;
15: cathode=8'h71;
default: cathode=8'h03;
endcase
end

endmodule