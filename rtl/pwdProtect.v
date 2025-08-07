module pwd_unlock(
    input clk, rst,
    input [1:0] key,
    output wire unlock
);

reg[2:0] counter;
parameter K1 = 2'b10, 
          K2 = 2'b01, 
          K3 = 2'b10, 
          K4 = 2'b11; 

always@(posedge clk, negedge rst)
begin
    if (!rst) begin
        counter <= 0;
    end else 
            begin
                case(counter)
                    0: if (key == K1) counter <= 1; else counter <= 0;
                    1: if (key == K2) counter <= 2; else counter <= 0;
                    2: if (key == K3) counter <= 3; else counter <= 0;
                    3: if (key == K4) counter <= 4; else counter <= 0;
                endcase
            end
end

assign unlock = (counter == 4) ? 1 : 0;
endmodule