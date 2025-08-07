module add_full(
    input a, b, cin,
    output sum, cout
);

wire s1, c1, c2;
add_half M1(a, b, s1, c1);
add_half M2(s1, cin, sum, c2);
or G1(cout, c1, c2);

endmodule