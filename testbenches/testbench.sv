`timescale 1ns/1ns
module testbench;
	
	logic i_clk;
	logic reset;
	logic input_pause;	
	logic dcrm;
	
	logic shift_left2;
	logic shift_right1;
	logic set; //Инициализация
	logic nsyst; //Выбор системы счисления в мультиплексоре
	
	
	logic	o_clk;
	
	logic [6:0] seven_Display1;//output
	logic [6:0] seven_Display2;
	logic [6:0] seven_Display3;
	logic [6:0] seven_Display4;
	
	logic [9:0] LEDS;
	
	parameter i_initial = 12'b 1011_0111_1000;
	parameter p_frequency = 1000000;
	
	localparam logic[31:0] lp_max_clock_buf = 50000000 / (p_frequency * 2);
	
	DUT
	#(
		.p_frequency(p_frequency),
		.i_initial(i_initial)
	)
	dut(.*);
	
	initial begin
		i_clk = 0;
		reset = 1;
		input_pause = 0;
		set = 0;

		nsyst = 1;
		dcrm = 0;
		shift_left2 = 0;
		shift_right1 = 0;
		
    
		fork 
			// block 1 - clock simulation
			forever #1 i_clk = ~i_clk;
			
			// block 2 - signals' vectors
			begin
				#(5*lp_max_clock_buf) 	reset = ~reset;
				#(10*lp_max_clock_buf) 	reset = ~reset;
				#(10*lp_max_clock_buf) 	set = ~set;
				#(15*lp_max_clock_buf) 	set = ~set;
				#(25*lp_max_clock_buf) 	dcrm = 0;
							shift_right1 = 0;
							shift_left2 = 0;		
				#(35*lp_max_clock_buf) 	dcrm = 0;
							shift_right1 = 0;
							shift_left2 = 0;	
				#(50*lp_max_clock_buf)	dcrm = 0;
							shift_right1 = 0;
							shift_left2 = 0;	
				#(60*lp_max_clock_buf)	input_pause = 0;
				#(75*lp_max_clock_buf)	nsyst = 0;		
				#(90*lp_max_clock_buf)   input_pause = 1;
				#(110*lp_max_clock_buf)  input_pause = 0;
			end
		join
	end
endmodule
