module add_half(
    input a, b,
    output sum, ca
);

assign sum = a ^ b;
assign ca = a & b;

endmodule