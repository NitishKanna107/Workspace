module add_cp_4(
    input [3:0]a, b,
    input cin,
    output [3:0]sum,
    output cout
);

assign cin = 1'b0;

wire p0, p1, p2, p3;
xor G1(p0, a[0], b[0]);
xor G2(p1, a[1], b[1]);
xor G3(p2, a[2], b[2]);
xor G4(p3, a[3], b[3]);

wire g0, g1, g2, g3;
and G5(g0, a[0], b[0]);
and G6(g1, a[1], b[1]);
and G7(g2, a[2], b[2]);
and G8(g3, a[3], b[3]);

wire c1, c2, c3;
wire t1, t2, t3, t4;

and G9(t1, p0, cin);
or G10(c1, g0, t1);

and G11(t2, p1, c1);
or G12(c2, g1, t2);

and G13(t3, p2, c2);
or G14(c3, g2, t3);

and G15(t4, p3, c3);
or G16(cout, g3, t4);

xor G17(sum[0], p0, cin);
xor G18(sum[1], p1, c1);
xor G19(sum[2], p2, c2);
xor G20(sum[3], p3, c3);

endmodule


