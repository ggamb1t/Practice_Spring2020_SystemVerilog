module DUT
#(
parameter i_initial = 12'b 1011_0111_1000,
parameter p_frequency = 10000
)

(
	input	logic i_clk,
	input	logic reset,
	input logic input_pause,	
	input logic dcrm,
	
	input	logic shift_left2,
	input	logic shift_right1,
	input	logic set, //Инициализация
	input	logic nsyst, //Выбор системы счисления в мультиплексоре
	
	output logic o_clk,
	
	output logic [6:0] seven_Display1,
	output logic [6:0] seven_Display2,
	output logic [6:0] seven_Display3,
	output logic [6:0] seven_Display4,
	
	output logic [9:0]LEDS
); 
	
	logic [11:0] inner_data;
	
	logic [6:0]inner_dec1;
	logic [6:0]inner_dec2;
	logic [6:0]inner_dec3;
	logic [6:0]inner_dec4;
	
	logic [6:0]inner_oct1;
	logic [6:0]inner_oct2;
	logic [6:0]inner_oct3;
	logic [6:0]inner_oct4;
	
	
	counter 
	#(
	.i_initial(i_initial)
	)
	Counter 
	(
	.o_clk(o_clk), //input
	.reset(reset),	
	.dcrm(dcrm),
	.shift_right1(shift_right1),
	.shift_left2(shift_left2),
	.set(set),
	.input_pause(input_pause),
	
	.data(inner_data) //output
	);
	
	
	ClockDivider //Регулятор частоты
	#(
		.p_frequency(p_frequency)
	)
	clockDivider
	(
		.i_clk(i_clk),
		.reset(reset),
		
		.o_clk(o_clk)
	);
	
	
	DecDecoder //Дешифратор десятичный
	DecDecoder1 
	(
	.data(inner_data),
	
	.Dec1(inner_dec1),
	.Dec2(inner_dec2),
	.Dec3(inner_dec3),
	.Dec4(inner_dec4)
	); 
	
	OctDecoder //Дешифратор восьмеричный
	OctDecoder1
	(
	.data(inner_data),
	
	.Oct1(inner_oct1),
	.Oct2(inner_oct2),
	.Oct3(inner_oct3),
	.Oct4(inner_oct4)
	);
	
	LEDS //Лампочки.
	leds1
	(
	.data(inner_data),
	
	.LEDS(LEDS)
	);
	
	
	MUL //Мультиплексор
	mul
	(
	.seven_Dec1(inner_dec1), //input
	.seven_Dec2(inner_dec2),
	.seven_Dec3(inner_dec3),
	.seven_Dec4(inner_dec4),
	.seven_Oct1(inner_oct1),
	.seven_Oct2(inner_oct2),
	.seven_Oct3(inner_oct3),
	.seven_Oct4(inner_oct4),
	.nsyst(nsyst),

	.seven_Display1(seven_Display1), //output
	.seven_Display2(seven_Display2),
	.seven_Display3(seven_Display3),
	.seven_Display4(seven_Display4)
	);

endmodule
