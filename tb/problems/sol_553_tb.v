module solution_tb;
reg clk, rst, x_in;
wire y_out;

solution DUT(.clk(clk), .rst(rst), .x_in(x_in), .y_out(y_out));

initial #50 $finish;
initial begin
	clk = 0;
	forever #5 clk = ~clk;
end

initial begin
	$dumpfile("sol_sim.vcd");
	$dumpvars(0, solution_tb);

	rst = 0;
	x_in = 0;
	#5 rst = 1;

	#10 x_in = 1;
	#25 x_in = 0;
end
endmodule
