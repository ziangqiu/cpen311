`default_nettype none
module ksa(

	//// CLOCK ////
   CLOCK_50,
	
	//// KEY ////
   KEY,    
	
	//// SWITCH ////
   SW,
	
	//// LED ////
   LEDR,
	LEDG,
	
);

//=======================================================
//  PORT declarations
//=======================================================

//////////// CLOCK //////////
input                       CLOCK_50;

//////////// LED //////////
output           [17:0]      LEDR;
output 			  [7:0]		  LEDG;

//////////// KEY //////////
input            [3:0]      KEY;

//////////// SW //////////
input           [17:0]      SW;

//=======================================================
//  REG/WIRE declarations
//=======================================================
// Input and output declarations
logic CLK_50M;
logic [17:0] LEDR;
logic [7:0]  LEG;
logic [17:0] SW;
logic [3:0] KEY;
assign CLK_50M = CLOCK_50;

//Control fsm
fsm mem_fsm( .clk(CLK_50M), .KEY(KEY), .SW(SW), .LEDG(LEDG), .LEDR(LEDR) );

endmodule
