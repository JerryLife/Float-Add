`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/21 21:10:29
// Design Name: 
// Module Name: num2digit
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


module num2digit(
	input [10:0] int,	//integer
	input [12:0] deci,	//decimal
	output [31:0] final_num 	//result number 
    );

	`include "h_log_2.vh"
	`include "log_2_23.vh"
	
	wire [7:0] remain;
	wire [22:0] frac; 
	wire [7:0] mov;
	wire [22:0] tmp1;
	assign remain = (log_2_11 (int)) - 1;
	assign frac = {int[9:0], deci};
	assign mov = log_2_23 (frac);
	assign tmp1 = frac << (24 - mov);
	assign final_num = {1'b0, remain[7:0], tmp1[22:0]};

endmodule
