function integer log_2_23;
	input [10:0] num;
	integer i;
	begin
		for (i = 0; 2 ** i < num; i = i + 1)
			log_2_23 = i + 1;
	end
endfunction