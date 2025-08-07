module seq_ct_tb;
reg d1, d2, x, clk;
wire q;

seq_ct DUT(.clk(clk), .x(x), .d1(d1), .d2(d2), .q(q));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $monitor("clk=%b | x=%b | d1=%b | d2=%b | q=%b", clk, x, d1, d2, q);

    #0 d1 = 1'b0;
    #0 d2 = 1'b1;
    #0 x = 1'b0;
    #13 x = 1'b1;

    #50 $finish;
end
endmodule