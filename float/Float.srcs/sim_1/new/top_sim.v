`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/22 10:12:10
// Design Name: 
// Module Name: top_sim
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


module top_sim();
    `include "h_log_2.vh"
	wire [10:0] result_int;
	wire [12:0] result_deci;
	reg [10:0] int1, int2;
	reg [12:0] deci1, deci2;

	initial begin
		int1 <= 12;
		deci1 <= 'b0110100000000;
		int2 <= 100;
		deci2 <= 'b1001000000000;
	end

	always @(*) begin
		int1 <= 12;
		deci1 <= 'b0110100000000;
		int2 <= 100;
		deci2 <= 'b1001000000000;
	end

	top t (int1, deci1, int2, deci2, result_int, result_deci);
endmodule
