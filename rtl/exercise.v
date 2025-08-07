module power1(
    input [3:0]a,
    output y
);

wire t1, t2, t3;
and G1(t1, a[1], a[2]);
and G2(t2, a[0], a[2]);
and G3(t3, a[0], a[1]);
or G4(y, t1, t2, t3);

endmodule