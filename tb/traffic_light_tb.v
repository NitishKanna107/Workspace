module trafficLight_tb;

reg clk, rst;
wire red, yellow, green;

trafficLights DUT(.clk(clk), .rst(rst), .red(red), .yellow(yellow), .green(green));

initial #200 $finish;
initial begin clk = 0; forever #5 clk = ~clk; end

initial begin
	rst = 0;
	#5 rst = 1;
end

initial begin
	$dumpfile("traffic_sim.vcd");
	$dumpvars(0, trafficLight_tb);
	$dumpvars(0, DUT);
end
endmodule
