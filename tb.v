`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2022 19:47:25
// Design Name: 
// Module Name: tb
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


module unfolding_tb;
reg A,B,Cin,clk,clr;
wire S,C_in ;

Serial_adder dut (A,B,Cin,C_in,clk,clr,S);



initial begin

clk=1'b0;
A = 1;
B = 1;
Cin = 0;
clr = 1;

#10 clr = 0;
A = 1;
B = 1;
Cin = 0;

#10 clr = 0;
A = 0;
B = 1;
Cin = 0;

#10 clr = 0;
A = 1;
B = 0;
Cin = 0;

#10 clr = 0;
A = 1;
B = 1;
Cin = 0;


#10 clr = 0;
A = 0;
B = 1;
Cin = 0;

#50 $stop;
end
always #5 clk = ~clk;
endmodule