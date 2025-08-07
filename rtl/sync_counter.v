module t_ff(
    input clk, rst, T,
    output reg Q
);
always@(posedge clk, negedge rst)
begin
    if (!rst) Q <= 1'b0;
    else if (T) Q <= ~Q;
end
endmodule

module sync_counter(
    input clk, rst,
    output wire[3:0] A
);

t_ff T1(clk, rst, 1'b1, A[0]);
t_ff T2(clk, rst, A[0], A[1]);
t_ff T3(clk, rst, A[1] & A[0], A[2]);
t_ff T4(clk, rst, A[1] & A[0] & A[2], A[3]);
endmodule