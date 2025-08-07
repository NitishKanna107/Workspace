module d_latch_tb;
reg s, en;
wire Q;

d_latch d1(.en(en), .D(s), .Q(Q));

initial begin
    $display("en | D | Q");
    $monitor("%b  | %b | %b", en, s, Q);

    en = 1'b0; s = 1'b0; #0
    en = 1'b1; s = 1'b0; #5
    en = 1'b1; s = 1'b1; #10
    en = 1'b0; s = 1'b0; #15

    $finish;
end
endmodule