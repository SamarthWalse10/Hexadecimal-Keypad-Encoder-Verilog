`timescale 1ns / 1ps


module hex_4x4_keypad_encoder_tb();
reg clk,rst;
reg [3:0]row;
wire [3:0]col,button;

hex_4x4_keypad_encoder dut(.clk(clk),.rst(rst),.row(row),.col(col),.button(button));

initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1'b1; row = 4'd0;
    #17 rst = 1'b0;
    #12 row = 4'd1;
    #29 row = 4'b0;
    #31 row = 4'b1;
    #6 row = 4'b0;
    #10 row = 4'b1;
    #26 row = 4'b0;
    #37 row = 4'd2;
    #7 row = 4'd0;
    #20 row = 4'd2;
    #26 row = 4'd0;
    #38 row = 4'd4;
    #6 row = 4'd0;
    #10 row = 4'd4;
    #23 row = 4'd0;
    #40 row = 4'd8;
    #7 row = 4'd0;
    #30 row = 4'd8;
    #22 row = 4'd0;
    #41 row = 4'd1;
    #7 row = 4'd0;
    #83
    $stop;    
end

endmodule
