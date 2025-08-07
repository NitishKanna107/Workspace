module uart_tx(
    input clk, rst,
    input[7:0] data,
    input tx_active,
    output tx
);
parameter clk_rate = 100000000;
parameter baud_rate = 115200;
parameter clk_div = clk_rate / baud_rate; // clock division according to baud rate

parameter IDLE = 0, START = 1, DATA = 2, STOP = 3; // FSM states for TX

reg[2:0] data_index; // keep track of the bits sent
reg[9:0] clk_count;
reg[1:0] state;

reg tx_state; 

always@(posedge clk, negedge rst) begin
    if (!rst) begin
        state <= IDLE;
        data_index <= 0;
        clk_count <= 0;
        tx_state <= 1'b1; // idle state when tx is pulled high
    end
    else begin
        case (state) 
        IDLE: begin
            tx_state <= 1'b1;
            clk_count <= 0;
            data_index <= 0;

            if (tx_active) state <= START;
        end

        START: begin
            tx_state <= 1'b0; // pull low for one clock cycle
            if (clk_count < clk_div) clk_count <= clk_count + 1;
            else begin
                state <= DATA; 
                clk_count <= 0;
            end
        end

        DATA: begin
            if (clk_count < clk_div) begin
                clk_count <= clk_count + 1;
                tx_state <= data[data_index];
            end
            else begin
                if (data_index == 3'b111) begin
                    state <= STOP; 
                    clk_count <= 0;
                end
                else begin
                    clk_count <= 0; 
                    data_index <= data_index + 1;
                end
            end
        end

        STOP: begin
            tx_state <= 1'b0;
            if (clk_count < clk_div) clk_count <= clk_count + 1;
            else begin
                state <= IDLE; 
                tx_state <= 1'b1;
            end
        end
        endcase
    end
end

assign tx = tx_state;
endmodule