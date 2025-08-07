module workspace(
    input clk,
    input x,
    output reg y
);

reg a = 1'b0;
always@(posedge clk) begin
    y = x;
end

endmodule