`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2023 22:19:29
// Design Name: 
// Module Name: RefreshCounter
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


module RefreshCounter(clk,rst,ref);
input clk,rst;
output reg[1:0] ref;

always@(posedge clk)
begin
if(rst) ref<=0;
else
begin
if(ref==3) ref<=1;
else ref<=ref+1;
end
end

























endmodule
