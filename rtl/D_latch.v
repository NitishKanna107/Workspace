module d_latch(
    output reg Q,
    input D, en
);

always@(en, D)
    if (en) Q <= D;

endmodule