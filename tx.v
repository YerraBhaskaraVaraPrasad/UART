`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2023 22:38:24
// Design Name: 
// Module Name: tx
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


module tx(clk,rst,newd,data,tx,tx_done);
input clk,rst,newd;
input [7:0]data;
output reg tx,tx_done;

parameter idle=2'b00,start=2'b01,transfer=2'b10,done=2'b11;
reg [1:0]ps,ns;
reg [3:0]count;
reg [7:0]tmp;

always@(posedge clk)
begin
if(rst) tmp<=8'h00;
else
begin
if(newd) tmp<=data;
else tmp<=8'h00;
end
end


always@(posedge clk)
begin
if(rst) count<=0;
else count<=(count+1);
end


always@(posedge clk)
begin
if(rst) ps<=idle;
else ps<=ns;
end

always@*
begin
case(ps)

idle:
begin
if(newd) ns=start;
else ns=idle;
end

start:
begin
ns=transfer;
end

transfer:
begin
if(count==8) ns=done;
else ns=transfer;
end

done:
begin
ns=idle;
end
endcase
end

always@*
begin
case(ps)

idle:
begin
tx=1;
tx_done=0;
end

start:
begin
tx=0;
tx_done=0;
count=0;
end

transfer:
begin
tx=tmp[count-1];
tx_done=0;
end

done:
begin
tx=1;
tx_done=1;
end
endcase
end




















endmodule