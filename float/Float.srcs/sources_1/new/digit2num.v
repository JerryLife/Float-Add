`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/22 14:38:18
// Design Name: 
// Module Name: digit2num
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


module digit2num(
	input [31:0] num,
	output [10:0] int_,
	output [12:0] deci
    );
	
	wire [22:0] frac, f1;
	wire [23:0] decimal, tmp;
	wire [7:0] mov;

	assign frac[22:0] = num[22:0];
	assign decimal[23:0] = {1'b1, frac[22:0]};
	assign mov[7:0] = num[30:23];
	assign f1[22:0] = frac[22:0] << (mov);
	assign deci[12:0] = f1[22:10];
	assign tmp[23:0] = decimal[23:0] >> (23 - mov);
	assign int_[10:0] = tmp[10:0];

endmodule
