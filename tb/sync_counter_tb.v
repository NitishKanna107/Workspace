module sync_counter_tb;
reg clk, rst;
wire[3:0] A;

sync_counter DUT(clk, rst, A);

initial #200 $finish;
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("syncCount_sim.vcd");
    $dumpvars(0, sync_counter_tb);

    rst = 0;
    #5 rst = 1;
end
endmodule