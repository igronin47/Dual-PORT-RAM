`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2023 10:38:56
// Design Name: 
// Module Name: RAM
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


module DUAL_PORT_RAM (CLK, EN_WR, EN_RD, ADDR_WR, ADDR_RD, D_IN, D_OUT);
parameter DATA_WIDTH=4;
parameter ADDR_WIDTH=1;
parameter DEPTH=2;
input CLK, EN_WR, EN_RD;
input [ADDR_WIDTH-1:0] ADDR_WR;
input [ADDR_WIDTH-1:0] ADDR_RD;
input [DATA_WIDTH-1:0] D_IN;
output [DATA_WIDTH-1:0] D_OUT;

reg [DATA_WIDTH-1:0] mem [DEPTH-1:0];
reg [DATA_WIDTH-1:0] OUT;

always @(posedge CLK)
begin
if (EN_WR==1'b1)
mem[ADDR_WR] <= D_IN;
end

always @(posedge CLK)
begin
if (EN_RD==1'b1)
OUT <= mem[ADDR_RD];
end

assign D_OUT = OUT;
endmodule