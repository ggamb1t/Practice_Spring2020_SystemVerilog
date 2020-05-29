module MUL
(
	input	logic [6:0]	seven_Dec1,
	input	logic [6:0]	seven_Dec2,
	input	logic [6:0]	seven_Dec3,
	input	logic [6:0]	seven_Dec4,
	
	input	logic [6:0]	seven_Oct1,
	input	logic [6:0]	seven_Oct2,
	input	logic [6:0]	seven_Oct3,
	input	logic [6:0]	seven_Oct4,
	
	input logic nsyst, // 1 - dec, 0 - oct

	output logic [6:0] seven_Display1,
	output logic [6:0] seven_Display2,
	output logic [6:0] seven_Display3,
	output logic [6:0] seven_Display4
);
 
assign //var 1
{ seven_Display4, seven_Display3, seven_Display2, seven_Display1 } = nsyst ?
{seven_Dec4, seven_Dec3, seven_Dec2, seven_Dec1 } : {seven_Oct4, seven_Oct3, seven_Oct2, seven_Oct1 };

//assign seven_Display4 = nsyst ? seven_Dec4 : seven_Oct4; //var 2
//assign seven_Display3 = nsyst ? seven_Dec3 : seven_Oct3;
//assign seven_Display2 = nsyst ? seven_Dec2 : seven_Oct2;
//assign seven_Display1 = nsyst ? seven_Dec1 : seven_Oct1;

//always_ff @(nsyst) //var 3
//begin
//	if (nsyst) 
//	begin
//		seven_Display1 <= seven_Dec1;
//		seven_Display2 <= seven_Dec2;
//		seven_Display3 <= seven_Dec3;
//		seven_Display4 <= seven_Dec4;
//	end
//	else
//	begin
//		seven_Display1 <= seven_Oct1;
//		seven_Display2 <= seven_Oct2;
//		seven_Display3 <= seven_Oct3;
//		seven_Display4 <= seven_Oct4;
//	end
//end


	
endmodule
