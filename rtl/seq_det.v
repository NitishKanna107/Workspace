module mealy_mac(
    input clk, rst, x,
    output reg y
);

parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
reg[1:0] state, next_state;

always@(posedge clk, negedge rst)
begin
    if (!rst) state <= S0;
    else state <= next_state;
end

always@(state, x)
begin
    case(state)
        S0: if(x) next_state <= S1; else next_state <= S0;
        S1: if(x) next_state <= S3; else next_state <= S0;
        S2: if(!x) next_state <= S0; else next_state <= S2;
        S3: if(x) next_state <= S2; else next_state <= S0;
    endcase
end

always@(state, x)
begin
    case(state)
        S0: y = 0;
        S1, S2, S3: y = !x;
    endcase
end
endmodule
