module trafficLights(
	input clk,
	input rst,
	output red,
	output green,
	output yellow
);

reg[1:0] state;
reg[1:0] timer;

parameter SO = 2'b00, SR = 2'b01, SY = 2'b10, SG = 2'b11;

always@(posedge clk or negedge rst)
begin
	if (!rst) begin
		state <= SO; timer <= SO;
	end else begin
		if (timer == SG) timer <= SO;
		else timer <= timer + 1;

		if (timer == SG) begin
			if (state == SG) state <= SR;
			else state <= state + 1;
		end
	end
end

assign red = (state == SR);
assign green = (state == SG);
assign yellow = (state == SY);

endmodule


