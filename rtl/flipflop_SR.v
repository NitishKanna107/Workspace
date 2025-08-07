module sr_latch(
    input s, r,
    output q, qbar
);

nand (q, s, qbar);
nand (qbar, r, q);

endmodule