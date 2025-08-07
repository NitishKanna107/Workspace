module power1_test;

reg [3:0]a;
wire y;

power1 M1(.a(a), .y(y));

initial begin
    $monitor("%b %b %b | %b", a[0], a[1], a[2], y);

    a[0] = 0; a[1] = 0; a[2] = 0; #10;
    a[0] = 0; a[1] = 0; a[2] = 1; #10;
    a[0] = 0; a[1] = 1; a[2] = 0; #10;
    a[0] = 0; a[1] = 1; a[2] = 1; #10;
    a[0] = 1; a[1] = 0; a[2] = 0; #10;
    a[0] = 1; a[1] = 0; a[2] = 1; #10;
    a[0] = 1; a[1] = 1; a[2] = 0; #10;
    a[0] = 1; a[1] = 1; a[2] = 1; #10;

    $finish;
end

endmodule
