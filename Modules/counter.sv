module counter
#(parameter i_initial)
(
	input	logic	o_clk,
	input	logic	reset,
	input logic	dcrm,
	input	logic	shift_right1,
	input	logic	shift_left2,
	input	logic	set,
	
	input	logic input_pause, // 1 - pause, 0 - programm active

	output logic [11:0] data
);

	always_ff @(posedge o_clk, negedge reset)
	
		if (~reset) 
			data <= 0; //сброс у-ва
		else if (input_pause)
			data <= data;
		else if (set)
			data <= i_initial; //инициализация
		else
			begin
			 if (dcrm)
					data <= data - 12'd1; //декремент на 1
			 else if (shift_right1)
					data= {data[11], data[10:0]}; //сдвиг вправо на 1
			 else if (shift_left2)
					data={data[9:0],data[11:10]}; //сдвиг влево на 2
			end
endmodule
			
		

	