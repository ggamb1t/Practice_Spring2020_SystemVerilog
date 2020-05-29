module ClockDivider
#(
		parameter p_frequency = 1	
 )

(
	input wire i_clk,
	input wire reset,
	
	output logic o_clk
);
	
	localparam logic[31:0] lp_div_cnt = 50000000/(2*p_frequency);
	logic [25:0] counter = 26'd0;
	
	always_ff @(posedge i_clk, negedge reset)
	begin
		if (~reset)
		begin
			counter <= 0;
			o_clk <= 0;
		end

		else
		begin
			counter <= counter + 26'd1;
			if(counter == lp_div_cnt)
			begin
				counter <= 0;
				o_clk <= !o_clk;
			end
		end
	end
endmodule 