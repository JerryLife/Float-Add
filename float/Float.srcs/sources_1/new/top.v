`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/22 10:02:24
// Design Name: 
// Module Name: top
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


module top(
	input [10:0] int1,
	input [12:0] deci1,
	input [10:0] int2,
	input [12:0] deci2,
	output [10:0] result_int,
	output [12:0] result_deci
    );

	wire [31:0] num1, num2;
	wire [31:0] result;

	num2digit nd1 (int1, deci1, num1);
	num2digit nd2 (int2, deci2, num2);

	float f (num1, num2, result);
	digit2num dn (result, result_int, result_deci);

endmodule
