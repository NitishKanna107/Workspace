module mealy_mac_tb;
reg clk, rst, x;
wire y;

mealy_mac DUT(.clk(clk), .rst(rst), .x(x), .y(y));

initial #200 $finish;
initial begin clk = 0; forever #5 clk = ~clk; end

initial fork
    rst = 0;
    #2 rst = 1;
    #87 rst = 0;
    #89 rst = 1;

    #10 x = 1;
    #30 x = 0;
    #40 x = 1;
    #50 x = 0;
    #52 x = 1;
    #54 x = 0;
    #80 x = 1;
    #100 x = 0;
    #120 x = 1;
join

    // Dump waveform
initial begin
    $dumpfile("seq_det_sim.vcd");
    $dumpvars(1, mealy_mac_tb);
end
endmodule
