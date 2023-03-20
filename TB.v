`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2023 10:42:34
// Design Name: 
// Module Name: TB
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


module TB();
parameter DATA_WIDTH=4;
parameter ADDR_WIDTH=1;
parameter DEPTH=2;
reg [DATA_WIDTH-1:0]D_IN;
reg [ADDR_WIDTH-1:0]ADDR_WR;
reg [ADDR_WIDTH-1:0] ADDR_RD;
reg CLK, EN_WR, EN_RD;
wire [DATA_WIDTH-1:0]D_OUT;
integer i;

DUAL_PORT_RAM uut(.CLK(CLK), .EN_WR(EN_WR), .EN_RD(EN_RD), .ADDR_WR(ADDR_WR), .ADDR_RD(ADDR_RD), .D_IN(D_IN), .D_OUT(D_OUT));

initial begin
CLK = 1'b0;
EN_WR=0;
EN_RD=0;
ADDR_WR = 0;
ADDR_RD = 0;
D_IN = 0;

for(i =0; i<2; i= i+1) begin
@(posedge CLK);
write();
end


for(i =0; i< 2; i= i+1) begin
@(posedge CLK)
read();
end
$stop;
end

always #5 CLK = ~CLK;

task write();
begin
ADDR_WR = ADDR_WR + 1;
EN_WR = 1'b1;
D_IN = 3*(i+1);
end
endtask

task read();
begin
ADDR_RD = ADDR_RD - 1;
EN_RD = 1'b1;
end
endtask

endmodule
