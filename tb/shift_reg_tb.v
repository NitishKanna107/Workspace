module shift_reg_tb;
reg clk, sin, rst;
wire sout;

shift_reg DUT(clk, rst, sin, sout);

initial #100 $finish;
initial begin
    $dumpfile("sim/shift_sim.vcd");
    $dumpvars(0, shift_reg_tb);

    clk = 0;
    forever #5 clk = ~clk;
end

initial fork
    rst = 0;
    sin = 0;
    #8 rst = 1;
    
    #22 sin = 1;
join
endmodule