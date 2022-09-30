`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.09.2022 19:46:43
// Design Name: 
// Module Name: serial_adder
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


module adder(A,B,Cin,S,Cout);     //ADDER MODULE
input A,B,Cin;
output S,Cout;
assign S=A^B^Cin;
assign Cout=A&B | B&Cin | A|Cin;
endmodule


module D_FF(A,out,clk,clr);    //D flip-flop for delay
input A,clk,clr;
output reg out;
always @(posedge clk)begin
if(clr)out<=0;
else out<=A;
end
endmodule


module counter(clk,clr,out);    //Mod-9 COUNTER MODULE
parameter N=9;
input clk,clr;
output reg[5:0] out;
always @(posedge clk)begin
if(clr)out<=6'b0;
else if(out==N)out<=0;
else out<=out+1;
end
endmodule


module mux2to1(A,B,out,sel);    //MULTIPLEXER MODULE
input A,B,sel;
output out;
assign out=sel?A:B;
endmodule


module Serial_adder(A,B,Cin,C_in,clk,clr,S);   //MAIN MODULE
input A,B,clr,clk,Cin;
output C_in,S;
wire Cout,sel,D1_out,C_in,D2_out;
wire[5:0] count;
assign sel=(count==0);
counter C(clk,clr,count);
mux2to1 M(Cin,D2_out,C_in,sel);   //c_in mux output D2_out mux in afer 2 delays
D_FF D1(Cout,D1_out,clk,clr);
D_FF D2(D1_out,D2_out,clk,clr);
adder Add(A,B,C_in,S,Cout);
endmodule