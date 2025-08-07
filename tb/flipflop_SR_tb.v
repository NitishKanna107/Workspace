module sr_latch_tb;

reg S, R;
wire Qg, Qng;     // Gate-level outputs

// Instantiate gate-level latch
sr_latch G (.s(S), .r(R), .q(Qg), .qbar(Qng));

initial begin
    $display("Time S R | Qg Qng");
    $monitor("%4t  %b %b |  %b   %b", $time, S, R, Qg, Qng);

    S = 1; R = 1; #10;   // Hold
    S = 0; R = 1; #10;   // Set
    S = 1; R = 1; #10;   // Hold
    S = 1; R = 0; #10;   // Reset
    S = 0; R = 0; #10;   // Invalid
    S = 1; R = 1; #10;   // Back to hold

    $finish;
end

endmodule
