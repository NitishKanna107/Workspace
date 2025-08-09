module FA(
    input A, B, Cin,
    output sum, Cout
);
assign sum = (A ^ B) ^ Cin;
assign Cout = (A & B) | (B & Cin) | (A & Cin);
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
    input clk, rst, sIn,
    output sOut
);
wire t1, t2, t3;
dff D1(clk, rst, sIn, t1);
dff D2(clk, rst, t1, t2);
dff D3(clk, rst, t2, t3);
dff D4(clk, rst, t3, sOut);
endmodule

module serAdder(
    input clk, rst, load, A, B,
    output S
);
wire t1, t2, S1, C1, C2;

reg4 RA(clk, rst, A, t1); //input reg A
reg4 RB(clk, rst, B, t2); //input reg B

//load blocks the input to the FA by setting it to 0
FA FA1(t1 & load, t2 & load, C1, S1, C2); //full adder
dff FF1(clk, rst, C2, C1); //dff to store carry

reg4 RC(clk, rst, S1, S); //sum register
endmodule