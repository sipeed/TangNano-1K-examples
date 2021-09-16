module led (
    input sys_clk,
    input sys_rst_n,
    output reg [2:0] led // 110 R, 101 B, 011 G
);

reg [31:0] counter;

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        counter <= 31'd0;
        led <= 3'b110;
    end
    else if (counter < 31'd1350_0000)       // 0.5s delay
        counter <= counter + 1;
    else begin
        counter <= 31'd0;
        led[2:0] <= {led[1:0],led[2]};
    end
end

endmodule
