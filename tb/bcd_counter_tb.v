module bcd_counter_tb;
reg clk, rst;
wire[3:0] A;

bcd_counter DUT(clk, rst, A);

initial #200 $finish;
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("bcdCount_sim.vcd");
    $dumpvars(0, bcd_counter_tb);

    rst = 0;
    #5 rst = 1;
end
endmodule