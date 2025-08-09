module serAdder_tb;
reg clk, rst, load, A, B;
wire S;

serAdder DUT(clk, rst, load, A, B, S);

initial #90 $finish;
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("serAdder_sim.vcd");
    $dumpvars(0, serAdder_tb);

    $display("clk | load | s1 | s2 | s3 | s4");
    $monitor("%b | %b | %b | %b | %b | %b", clk, load, DUT.RC.D1.Q, DUT.RC.D2.Q, DUT.RC.D3.Q, DUT.RC.D4.Q);

    rst = 0;
    load = 0;
    A = 0; B = 0;

    #5 rst = 1;

    #10 A = 0; B = 1;
    #10 A = 1; B = 1;
    #10 A = 0; B = 1;
    #10 A = 1; B = 0;

    #3 load = 1;
    #40 load = 0;
end
endmodule