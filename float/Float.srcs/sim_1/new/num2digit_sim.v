`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/22 11:08:52
// Design Name: 
// Module Name: num2digit_sim
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


module num2digit_sim();
	`include "h_log_2.vh"
	wire [31:0] result;
	reg [10:0] int1;
	reg [12:0] deci1;

	initial begin
		int1 <= 100;
		deci1 <= 'b1001000000000;
	end

	always @(*) begin
		int1 <= 100;
		deci1 <= 'b1001000000000;
	end

	num2digit n2d (int1, deci1, result);
endmodule
