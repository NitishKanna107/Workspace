module decoder_2_4_test;
reg A, B, en;
wire [0:3]D;

decoder_2_4 M1(.A(A), .B(B), .en(en), .D(D));

initial begin
    $display("A B en | D");
    $monitor("%b %b %b  | %b", A, B, en, D);

    en = 1;
    A = 0; B = 0; #10;
    A = 0; B = 1; #10;
    A = 1; B = 0; #10;
    A = 1; B = 1; #10;

    $finish;
end

endmodule