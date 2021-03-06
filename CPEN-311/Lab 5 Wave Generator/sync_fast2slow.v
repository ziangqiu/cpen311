module sync_fast2slow( hi_clk, lo_clk, data_in, data_out );

input hi_clk, lo_clk;
input [11:0] data_in;
output [11:0] data_out;

reg FF1_reg, FF1_next, FF2_reg, FF2_next, en;
reg[11:0] reg1_next, reg1, reg2_next, reg2, reg3_next, reg3;
wire[11:0] data_in, data_out;

always@(posedge hi_clk) begin
	reg1 <= reg1_next;
	
	if(en == 1'b1) reg3 <= reg3_next;
end

always@(posedge ~hi_clk) begin
	FF1_reg <= FF1_next;
	FF2_reg <= FF2_next;
end

always@(posedge lo_clk) begin
	reg2 <= reg2_next;
end
	
//As per lecture fast to slow clk circuit
always@(*) begin
	//regs next state
	reg1_next <= data_in;
	reg3_next <= reg1;
	reg2_next <= reg3;
	
	//FF next state
	FF1_next <= lo_clk;
	FF2_next <= FF1_reg;
	
	//output 
	data_out <= reg2;
	en <= FF2_reg;
end

endmodule
