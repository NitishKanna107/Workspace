module jk_counter_tb;
reg clk, rst;
wire a, b;

jk_counter DUT(.clk(clk), .a(a), .b(b), .rst(rst));

initial begin #50 $finish; end

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $monitor("T=%0t | clk=%b | a=%b | b=%b", $time, clk, a, b);

    rst = 1;
    #10 rst = 0;

    $dumpfile("jk_counter_sim.vcd");
    $dumpvars(0, jk_counter_tb);
end
endmodule