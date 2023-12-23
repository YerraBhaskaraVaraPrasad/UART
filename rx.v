`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2023 12:00:45
// Design Name: 
// Module Name: rx
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


module rx(clk,rst,r,data_out,rx_done,final);
input clk,rst,r;
output reg rx_done;
output reg [7:0]data_out,final;
reg [2:0]ps,ns;
parameter idle=2'b00,start=2'b01,receive=2'b10,done=2'b11;
reg [3:0]count;
reg [7:0]tmp;

always@(posedge clk)
begin
if(rst) count<=0;
else count<=count+1;
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
if(r==0) ns=start;
else ns=idle;
end

start:
begin
ns=receive;
end

receive:
begin
if(count==8) ns=done;
else ns=receive;
end

done: ns=idle;
endcase
end


always@*
begin
case(ps)
idle:
begin
data_out=8'h00;
rx_done=0;
count=0;
end

start:
begin
count=0;
end

receive:
begin
data_out[7-(count-1)]=r;
rx_done=0;
end

done:
begin
if(r) 
begin
rx_done=1;
end
else rx_done=0;
end

endcase
end


always@(data_out,rx_done)
begin
if(rx_done) final=data_out;
else final=8'd0;
end




















endmodule
