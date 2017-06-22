`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/21 15:22:54
// Design Name: 
// Module Name: float
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


module float(
	input [31:0] ori_num1,
	input [31:0] ori_num2,
	output [31:0] sum
    );
	
	wire [31:0] ori_exp1, ori_exp2;
	wire sign1, sign2;
	wire [7:0] exp1, exp2;
	wire [24:0] frac1, frac2, f1;
	reg [24:0] f2;
	reg [7:0] diff;	// |exp1 - exp2|
	reg [31:0] num1, num2;
	reg [7:0] final_exp;
	reg [22:0] final_frac;
	reg final_sig;

	// get exp of each number
	assign ori_exp1 = ori_num1[30:23];
	assign ori_exp2 = ori_num2[30:23];

	// ensure num1 > num2
	always @(*) begin
		if (ori_exp1 > ori_exp2) begin
			diff[7:0] = ori_exp1[7:0] - ori_exp2[7:0];
			num1[31:0] = ori_num1[31:0];
			num2[31:0] = ori_num2[31:0];
		end
		else begin
			diff[7:0] = ori_exp2[7:0] - ori_exp1[7:0];
			num1[31:0] = ori_num2[31:0];
			num2[31:0] = ori_num1[31:0];
		end
	end

	// partition the float numbers
	assign sign1 = num1[31];
	assign exp1 = num1[30:23];
	assign frac1 = {2'b01, num1[22:0]};
	assign sign2 = num2[31];
	assign exp2 = num2[30:23];
	assign frac2 = {2'b01, num2[22:0]};

	assign f1 = frac1 + (frac2 >> diff);
	always @(*) begin
		if (f1[24] == 1) begin
			final_exp[7:0] = exp1[7:0] + 1;
			f2[24:0] = f1[24:0] >> 1;
		end
		else begin
			final_exp[7:0] = exp1[7:0];
			f2[24:0] = f1[24:0];
		end
	end

	always @(f2) begin
		final_frac = f2[22:0];
	end

	always @(sign1 or sign2) begin
		final_sig =  sign1 & sign2;
	end

	assign sum = {final_sig, final_exp, final_frac};

endmodule
