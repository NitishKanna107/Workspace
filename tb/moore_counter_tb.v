module counter_tb;
reg clk, rst, x;
wire y;

counter DUT(.clk(clk), .rst(rst), .x(x), .y(y));

initial #80 $finish;
initial begin clk = 0; forever #5 clk = ~clk; end

initial fork
    rst = 0;
    #2 rst = 1;

    #3 x = 1;
    #7 x = 0;
    #20 x = 1;
    #29 x = 0;
    #35 x = 1;
join

    // Dump waveform
initial begin
    $dumpfile("counter_sim.vcd");
    $dumpvars(0, counter_tb);
    $dumpvars(1, DUT);
end
endmodule
