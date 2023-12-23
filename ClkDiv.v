`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2023 22:31:20
// Design Name: 
// Module Name: ClkDiv
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


module ClkDiv(clk,rst,refclk,remclk);
input clk,rst;
output reg refclk;
output reg remclk;

reg [15:0]refcount;
reg [26:0] remcount;

always@(posedge clk)
begin

if(rst)
begin
refclk<=1'b1;
refcount<=16'd0;
end

else
begin

if(refcount==16'd45000)
begin
refclk<=~refclk;
refcount<=16'd1;
end

else refcount<=refcount+1;

end

end


always@(posedge clk)
begin

if(rst)
begin
remclk<=1'b1;
remcount<=27'd0;
end

else
begin

if(remcount==27'd112500000)
begin
remclk<=~remclk;
remcount<=27'd1;
end

else remcount<=remcount+1;

end

end






















endmodule
