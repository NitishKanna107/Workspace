module add_cp_4_test;

reg [3:0]a, b;
reg cin;
wire [3:0]sum;
wire cout;

add_cp_4 M1(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

initial begin
    $display("A    B    | Sum  Ca");
    $monitor("%b %b | %b %b", a, b, sum, cout);

    a = 4'b1000; b = 4'b0011; cin = 0; #10;
    a = 4'b0000; b = 4'b0011; cin = 0; #10;
    a = 4'b1000; b = 4'b1011; cin = 0; #10;

    $finish;
end

endmodule