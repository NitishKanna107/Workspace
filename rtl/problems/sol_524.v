module dff(
    input clk, d,
    output reg q
);

always@(posedge clk) begin
    q <= d;
end
endmodule

module seq_ct(
    input clk, x, d1, d2,
    output q
);

wire d;
dff ff1(clk, d, q);

assign d = (~x & d1) | (x & d2);

endmodule