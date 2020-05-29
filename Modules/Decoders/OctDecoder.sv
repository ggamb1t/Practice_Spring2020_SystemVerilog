module OctDecoder
//Входит init, разделяем на 4 по 3 бита. 
(
	input logic [11:0] data,
	
	output logic[6:0] Oct1,
	output logic[6:0] Oct2,
	output logic[6:0] Oct3,
	output logic[6:0] Oct4
);

	localparam num0 = 7'b 1000000;
   localparam num1 = 7'b 1111001;
   localparam num2 = 7'b 0100100;
   localparam num3 = 7'b 0110000;
   localparam num4 = 7'b 0011001;
   localparam num5 = 7'b 0010010;
   localparam num6 = 7'b 0000010;
   localparam num7 = 7'b 1111000;
   localparam numOff = 7'b 1111111;

	

	always_comb
		begin
			case(data[11:9])
			0: Oct1 <= num0;
			1: Oct1 <= num1;
			2: Oct1 <= num2;
			3: Oct1 <= num3;
			4: Oct1 <= num4;
			5: Oct1 <= num5;
			6: Oct1 <= num6;
			7: Oct1 <= num7;
			default:Oct1 <= numOff;
			endcase
			
			case(data[8:6])
			0: Oct2 <= num0;
			1: Oct2 <= num1;
			2: Oct2 <= num2;
			3: Oct2 <= num3;
			4: Oct2 <= num4;
			5: Oct2 <= num5;
			6: Oct2 <= num6;
			7: Oct2 <= num7;
			default:Oct2 <= numOff;
			endcase
			
			case(data[5:3])
			0: Oct3 <= num0;
			1: Oct3 <= num1;
			2: Oct3 <= num2;
			3: Oct3 <= num3;
			4: Oct3 <= num4;
			5: Oct3 <= num5;
			6: Oct3 <= num6;
			7: Oct3 <= num7;
			default:Oct3 <= numOff;
			endcase
			
			case(data[2:0])
			0: Oct4 <= num0;
			1: Oct4 <= num1;
			2: Oct4 <= num2;
			3: Oct4 <= num3;
			4: Oct4 <= num4;
			5: Oct4 <= num5;
			6: Oct4 <= num6;
			7: Oct4 <= num7;
			default:Oct4 <= numOff;
			endcase
		end
endmodule
