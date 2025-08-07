module mux_1_2_test;

reg a, b, sel;
wire y;

mux_1_2 M1(a, b, sel, y);

initial begin
    $display("A B S | Y");
    $monitor("%b %b %b | %b", a, b, sel, y);

    a = 1'b0; b = 1'b1; sel = 1'b0; #10;
    a = 1'b0; b = 1'b1; sel = 1'b1; #10;

    $finish;
end

endmodule