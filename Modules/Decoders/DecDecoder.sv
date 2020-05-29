module DecDecoder

//Входит init, разделяем на 4 по 3 бита. 
(

	input logic [11:0] data,
	
	output logic[6:0] Dec1, //Регистр для кодов HEX на каждую из 4 возможных цифр
	output logic[6:0] Dec2,
	output logic[6:0] Dec3,
	output logic[6:0] Dec4
);
	
	localparam num0 = 7'b 1000000; //Коды для цифр на HEX
   localparam num1 = 7'b 1111001;
   localparam num2 = 7'b 0100100;
   localparam num3 = 7'b 0110000;
   localparam num4 = 7'b 0011001;
   localparam num5 = 7'b 0010010;
   localparam num6 = 7'b 0000010;
   localparam num7 = 7'b 1111000;
   localparam num8 = 7'b 0000000;
   localparam num9 = 7'b 0010000;
   localparam numOff = 7'b 1111111;
	
	

	logic [27:0] bcd; //Регистр для перевода из двоичной системы в ДДК
	
always_comb
	begin 
	  
	  bcd = 28'd 0; //Инициализация нулями

	  bcd[11:0] = data[11:0];
	  for (logic [31:0] i = 0; i < 12; i = i + 1)
	  begin //if для каждого промежутка из 4 цифр
			if (bcd[27 : 24 ] > 4) //Тысячи
				 begin
					  bcd[27 : 24] = bcd[27 : 24 ] + 4'd3;
				 end
			if (bcd[23 : 20 ] > 4) //Сотни
				 begin
					  bcd[23 : 20] = bcd[23 : 20 ] + 4'd3;
				 end
			if (bcd[19 : 16 ] > 4) //Десятки
				 begin
					  bcd[19 : 16] = bcd[19 : 16 ] + 4'd3;
				 end
			if (bcd[15 : 12 ] > 4) //Единицы
				 begin
					  bcd[15 : 12] = bcd[15 : 12 ] + 4'd3;
				 end
			bcd = bcd << 1; // Сдвиг 
	  end

		case(bcd[27:24])
			4'd0: Dec1 = num0;
			4'd1: Dec1 = num1;
			4'd2: Dec1 = num2;
			4'd3: Dec1 = num3;
			4'd4: Dec1 = num4;
			4'd5: Dec1 = num5;
			4'd6: Dec1 = num6;
			4'd7: Dec1 = num7;
			4'd8: Dec1 = num8;
			4'd9: Dec1 = num9;
			default:Dec1 = numOff;
		endcase
		
		case(bcd[23:20])
			4'd0: Dec2 = num0;
			4'd1: Dec2 = num1;
			4'd2: Dec2 = num2;
			4'd3: Dec2 = num3;
			4'd4: Dec2 = num4;
			4'd5: Dec2 = num5;
			4'd6: Dec2 = num6;
			4'd7: Dec2 = num7;
			4'd8: Dec2 = num8;
			4'd9: Dec2 = num9;
			default:Dec2 = numOff;
		endcase
		
		case(bcd[19:16])
			4'd0: Dec3 = num0;
			4'd1: Dec3 = num1;
			4'd2: Dec3 = num2;
			4'd3: Dec3 = num3;
			4'd4: Dec3 = num4;
			4'd5: Dec3 = num5;
			4'd6: Dec3 = num6;
			4'd7: Dec3 = num7;
			4'd8: Dec3 = num8;
			4'd9: Dec3 = num9;
			default:Dec3 = numOff;
		endcase
		
		case(bcd[15:12])
			4'd0: Dec4 = num0;
			4'd1: Dec4 = num1;
			4'd2: Dec4 = num2;
			4'd3: Dec4 = num3;
			4'd4: Dec4 = num4;
			4'd5: Dec4 = num5;
			4'd6: Dec4 = num6;
			4'd7: Dec4 = num7;
			4'd8: Dec4 = num8;
			4'd9: Dec4 = num9;
			default:Dec4 = numOff;
		endcase
	
	end
	
endmodule
