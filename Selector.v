`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2023 23:24:07
// Design Name: 
// Module Name: Selector
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


module Selector(tx,final,ref,out);
input tx;
input [1:0]ref;
input [7:0]final;
output reg[3:0]out;

always@(*)
begin
case(ref)
1: out={3'b000,tx};
2: out=final[7:4];
3: out=final[3:0];
default: out=4'h0;
endcase
end

























endmodule
