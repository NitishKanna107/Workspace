module t_ff(
    input clk, rst, T,
    output reg A
);

always@(negedge clk, negedge rst) begin
    if (!rst) A <= 1'b0;
    else if (T == 1'b1) A <= ~A;
end
endmodule

module binary_counter(
    input clk, rst,
    output wire[3:0] A
);

t_ff T1(clk, rst, 1'b1, A[0]);
t_ff T2(A[0], rst, 1'b1, A[1]);
t_ff T3(A[1], rst, 1'b1, A[2]);
t_ff T4(A[2], rst, 1'b1, A[3]);
endmodule