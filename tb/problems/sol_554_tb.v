module solution_tb;
reg clk, x1, x2, rst;
wire y;

solution DUT(.clk(clk), .x1(x1), .x2(x2), .y(y), .rst(rst));

initial #100 $finish;
initial begin
	clk = 0;
	forever #5 clk = ~clk;
end

initial begin
	$dumpfile("sol_sim.vcd");
	$dumpvars(0, solution_tb);

	rst = 1;
	x1 = 0;
	x2 = 0;

	#2 rst = 0;
	#12 x1 = 1;
	#30 x2 = 1;
end
endmodule
