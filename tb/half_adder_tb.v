module add_half_test;

reg a, b;
wire sum, ca;

add_half UUT(a, b, sum, ca);

initial begin
    $display("Time A B | Sum Ca");
    $monitor("%4t %b %b |  %b   %b", $time, a, b, sum, ca);

    a = 1'b0; b = 1'b0; #10;
    a = 1'b0; b = 1'b1; #10;
    a = 1'b1; b = 1'b0; #10;
    a = 1'b1; b = 1'b1; #10;

    $finish;
end

endmodule
