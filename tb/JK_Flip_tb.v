`timescale 1ns/1ps

module jk_ff_tb;
reg j, k, clk;
wire q, qbar;

jk_ff ff1(.j(j), .k(k), .clk(clk), .q(q), .qbar(qbar));

initial clk = 0;
always #10 clk = ~clk;

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(1, jk_ff_tb);

    $display("   clk | J | K | Q | Q'");
    $timeformat(-6, 2, "us", 10);
    $monitor("%3t | %b | %b | %b | %b", $time, j, k, q, qbar);

    j = 1'b0; k = 1'b0; #10
    j = 1'b0; k = 1'b1; #20
    j = 1'b1; k = 1'b0; #20
    j = 1'b1; k = 1'b1; #20
    j = 1'b0; k = 1'b1; #20
    j = 1'b1; k = 1'b1; #20

    $finish;
end

endmodule
