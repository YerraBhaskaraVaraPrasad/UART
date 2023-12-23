`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.12.2023 00:18:19
// Design Name: 
// Module Name: AnodeDisplay
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


module AnodeDisplay(ref,anode);
input [1:0]ref;
output reg [7:0]anode;

always@(ref)
begin
case(ref)
1: anode=8'h7f;
2: anode=8'hfb;
3: anode=8'hfe;
default: anode=8'hff;
endcase
end





















endmodule
