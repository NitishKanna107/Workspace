module solution(
    input clk, x, rst,
    output y
);
reg [3:0] state, next_state;
parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100;

always@(posedge clk) begin
    if (rst) state <= S0;
    else state <= next_state; 
end

always@(state, x) begin
    case(state)
        S0: if (!x) next_state <= S3; else next_state <= S4;
        S1: if (!x) next_state <= S1; else next_state <= S4;
        S2: if (!x) next_state <= S2; else next_state <= S0;
        S3: if (!x) next_state <= S1; else next_state <= S2;
        S4: if (!x) next_state <= S2; else next_state <= S3;
    endcase
end

assign y = (state != S4) ? x : 1'b0;
endmodule