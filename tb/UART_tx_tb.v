`timescale 1ns / 1ps

module uart_tx_tb;
reg clk, rst, tx_active;
reg[7:0] data;
wire y_out;

uart_tx DUT(.clk(clk), .rst(rst), .tx(y_out), .tx_active(tx_active), .data(data));

initial #100000 $finish;
initial begin
	clk = 0;
	forever #5 clk = ~clk;
end

initial begin
	$dumpfile("uart_tx_sim.vcd");
	$dumpvars(0, uart_tx_tb);

	rst = 0;
	data = 8'b01000001; // character 'A' in ASCII
	#2 rst = 1;
	#15 tx_active = 1;
	#20 tx_active = 0;
end
endmodule
