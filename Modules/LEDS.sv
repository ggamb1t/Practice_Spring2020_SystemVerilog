module LEDS
( 
input logic [11:0]data,

output logic [9:0]LEDS

);

assign LEDS = data[9:0];

endmodule
