module decoder_2_4(
    input A, B, en,
    output [0:3]D //always [MSB:LSB], LSB is at the index 3 and MSB is at the index 0
);

assign en = 1'b1;

wire not_A, not_B;
not G1(not_A, A);
not G2(not_B, B);

and D0(D[0], not_A, not_B, en);
and D1(D[1], not_A, B, en);
and D2(D[2], A, not_B, en);
and D3(D[3], A, B, en);

endmodule