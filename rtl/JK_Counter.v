module jk_counter(
    input clk, rst,
    output a, b
);

wire a_bar;
wire b_bar;
wire ja, ka, jb, kb;

jk_ff ff1(.clk(clk), .j(ja), .k(ka), .q(a), .qbar(a_bar), .rst(rst));
jk_ff ff2(.clk(clk), .j(jb), .k(kb), .q(b), .qbar(b_bar), .rst(rst));

assign jb = 1'b1;
assign kb = 1'b1;

assign ja = b;
assign ka = b;

endmodule