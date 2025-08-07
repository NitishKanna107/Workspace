module solution_tb;
reg clk, rst, x_in;
wire y_out;

solution DUT(clk, rst, x_in, y_out);

initial #200 $finish;
initial begin
	clk = 0;
	forever #5 clk = ~clk;
end

initial begin
	$dumpfile("sol_sim.vcd");
	$dumpvars(0, solution_tb);

	rst = 0;
	x_in = 0;
	
	#2 rst = 1;
	#8 x_in = 1;
	#23 x_in = 0;
	#37 x_in = 1;
end
endmodule
