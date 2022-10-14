module On_Release_LED (
    input clk,
    input i1,
    output o1,
);
reg r_switch = 1'b0 ;
reg r_led = 1'b0;
wire w_switch1;

//instantiate debouncing filter
Debounce_Switch Instance(
    .clk(clk),
    .input1(i1),
    .output1(w_switch1)
);

always @(posedge clk) begin
    r_switch <= w_switch1; //creates a register
    if (w_switch1 == 1'b0 && r_switch == 1'b1) begin
        r_led <= ~r_led; //toggles register's value
    end 
end
assign o1 = r_led;
endmodule