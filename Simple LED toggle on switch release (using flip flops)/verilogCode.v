module On_Release_LED (
    input clk,
    input i1,
    output o1,
);
reg r_switch = 1'b0 ;
reg r_led = 1'b0;

always @(posedge clk) begin
    r_switch <= i1; //creates a register
    if (i1 == 1'b0 && r_switch == 1'b1) begin
        r_led <= ~r_led; //toggles register's value
    end 
end
assign o1 = r_led;
endmodule