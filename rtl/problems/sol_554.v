module solution(
    input x1, x2, clk, rst,
    output y
);
parameter active = 1'b1, idle = 1'b0;
reg state, next_state;

always@(posedge clk or posedge rst) begin
    if (rst) state <= idle;
    else state <= next_state;
end

always@(*) begin
    next_state = idle;
    case(state)
        idle: next_state = (x1 == x2);
        active: next_state = idle;
    endcase
end

assign y = state;
endmodule
