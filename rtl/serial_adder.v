module FA(
    input A, B, Cin,
    output sum, Cout
);
assign sum = (A ^ B) ^ Cin;
assign Cout = (A & B) | (B & Cin) | (A & Cin);
endmodule

module mux21(
    input A, B, S,
    output Y
);
assign Y = ((~S) & A) | (S & B);
endmodule

module dff(
    input clk, rst, D,
    output reg Q
);
always@(posedge clk, negedge rst) begin
    if (!rst) Q <= 1'b0;
    else Q <= D;
end
endmodule

module reg4(
    input clk, rst, sIn, load,
    output sOut
);
wire t1, t2, t3;
wire in1, in2, in3, in4;

mux21 M1(t1, sIn, load, in1);
dff D1(clk, rst, in1, t1);

mux21 M2(t2, t1, load, in2);
dff D2(clk, rst, in2, t2);

mux21 M3(t3, t2, load, in3);
dff D3(clk, rst, in3, t3);

mux21 M4(sOut, t3, load, in4);
dff D4(clk, rst, in4, sOut);
endmodule

module serAdder(
    input clk, rst, load, A, B,
    output S
);
wire t1, t2, S1, C1, C2;

reg4 RA(clk, rst, A, 1'b1, t1); //input reg A
reg4 RB(clk, rst, B, 1'b1, t2); //input reg B

//load blocks the input to the FA by setting it to 0
FA FA1(t1 & load, t2 & load, C1, S1, C2); //full adder
dff FF1(clk, rst, C2, C1); //dff to store carry

reg4 RC(clk, rst, S1, load, S); //sum register
endmodule