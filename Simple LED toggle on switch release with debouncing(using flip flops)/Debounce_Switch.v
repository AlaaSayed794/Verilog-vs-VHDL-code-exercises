module Debounce_Switch (
    input clk,
    input input1,
    input output1
);

parameter c_DEBOUNCE_LIMIT = 250000 ; //10 ms at 25MHz

reg r_state = 1'b0;
reg [17:0] r_count = 0;

always @(posedge clk) begin
    if (input1 !=== r_state && r_count < c_DEBOUNCE_LIMIT) 
        r_count <= r_count +1;

    else if (r_count == c_DEBOUNCE_LIMIT) begin
        r_count <= 0;
        r_state <= input1
    end
    else
    r_count<=0;
end

    assign output1 = r_state;
endmodule