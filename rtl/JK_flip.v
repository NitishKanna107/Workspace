module jk_ff(
    input j, k, clk, rst,
    output reg q,
    output reg qbar
);

always@(posedge clk)
begin/*
    case({j, k})
        2'b00: q = q;
        2'b01: q = 0;
        2'b10: q = 1;
        2'b11: q = ~q;
    endcase
    
    qbar = ~q;*/

    if (rst) begin
        q <= 1'b0;
        qbar <= ~q;
    end
    else begin
        q <= (j & ~q) | (~k & q);
        qbar <= ~q;
    end
end

endmodule