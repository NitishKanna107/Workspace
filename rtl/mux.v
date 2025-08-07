module mux_1_2(
    input a, b, sel, 
    output reg y
);

always@(a, b, sel)
    begin
        if (sel == 0) y = a;
        if (sel == 1) y = b;
    end

endmodule
