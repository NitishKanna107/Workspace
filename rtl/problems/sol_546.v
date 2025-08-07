module solution(
    input clk, rst, x_in,
    output y_out
);
parameter IDLE = 3'b000, 
          ACTIVE1= 3'b001, 
          ACTIVE2= 3'b010, 
          ACTIVE3= 3'b011, 
          LOW1= 3'b100, 
          LOW2= 3'b101;
reg [3:0] state, next_state;
reg x_state;
wire x_rise;

always@(posedge clk, negedge rst) begin
    if (!rst) state <= IDLE;
    else begin
        if (state >= ACTIVE1 && state < LOW2) state <= state + 1;
        else state <= next_state;
    end

    x_state <= x_in;
end

always@(state, x_rise) begin
    if (state == IDLE && x_rise == 1) 
        next_state = ACTIVE1;
    else if (state >= ACTIVE1 && state <= LOW2) begin
        if (state == ACTIVE3)
            next_state = LOW1;
        else if (state == LOW2)
            next_state = IDLE;
    end
    else next_state = IDLE;
end

assign y_out = ~(state == IDLE || state == LOW1 || state == LOW2);
assign x_rise = (~x_state & x_in);
endmodule
