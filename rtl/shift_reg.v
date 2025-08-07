module dff(
    input clk, rst, din,
    output reg q
);
always@(posedge clk, negedge rst) begin
    if (!rst) q <= 1'b0;
    else q <= din;
end
endmodule

module shift_reg(
    input clk, rst, sin,
    output sout
);
wire t1, t2, t3;

dff ff1(clk, rst, sin, t1);
dff ff2(clk, rst, t1, t2);
dff ff3(clk, rst, t2, t3);
dff ff4(clk, rst, t3, sout);

endmodule