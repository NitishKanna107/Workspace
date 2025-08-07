module add_full_test;

reg a, b, cin;
wire sum, cout;

add_full UUT(a, b, cin, sum, cout);

initial begin
    $monitor("%d %b %b %b | %b %b", $time, a, b, cin, sum, cout);

    a = 1'b0; b = 1'b0; cin = 1'b0; #10;
    a = 1'b0; b = 1'b0; cin = 1'b1; #10;
    a = 1'b0; b = 1'b1; cin = 1'b0; #10;
    a = 1'b0; b = 1'b1; cin = 1'b1; #10;
    a = 1'b1; b = 1'b0; cin = 1'b0; #10;
    a = 1'b1; b = 1'b0; cin = 1'b1; #10;
    a = 1'b1; b = 1'b1; cin = 1'b0; #10;
    a = 1'b1; b = 1'b1; cin = 1'b1; #10;

    $finish;
end

endmodule