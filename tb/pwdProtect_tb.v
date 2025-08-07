module pwd_unlock_tb;
reg clk, rst;
reg[1:0] key;
wire unlock;

pwd_unlock DUT(.clk(clk), .rst(rst), .key(key), .unlock(unlock));

initial #200 $finish;
initial begin 
    clk = 0;
    forever #5 clk = ~clk;
end

initial fork
    rst = 0;
    key = 2'b00;
    #2 rst = 1; 

    #12 key = 2'b10; 
    #22 key = 2'b01; 
    #32 key = 2'b10; 
    #42 key = 2'b11; 
join

initial begin
    $dumpfile("pwd_sim.vcd");
    $dumpvars(0, pwd_unlock_tb);
    $dumpvars(0, DUT);
end
endmodule