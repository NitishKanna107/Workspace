`timescale 1ns / 1ps

module assign_tb;
reg clk;
wire y;

workspace DUT(.clk(clk), .y(y));

initial #50 $finish;
initial begin
    $dumpfile("sim/assign.vcd");
    $dumpvars(0, assign_tb);
    
    clk = 0;
    forever #5 clk = ~clk;
end

endmodule