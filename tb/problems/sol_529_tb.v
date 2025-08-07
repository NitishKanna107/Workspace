module solution_tb;
reg clk, x, rst;
wire y;

solution DUT(.clk(clk), .x(x), .y(y), .rst(rst));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("sim/sol_529.vcd");
    $dumpvars(0, solution_tb);

    $monitor("clk=%b | x=%b | y=%b", clk, x, y);
    x = 0;
    rst = 1;
    #6 rst = 0;

    #100 $finish;
end

endmodule