`timescale 1ns / 1ps


module hex_4x4_keypad_encoder #(parameter S0=3'd0, parameter S1=3'd1, parameter S2=3'd2, parameter S3=3'd3, parameter S4=3'd4, parameter S5=3'd5)(rst,clk,row,col,button);
input rst,clk;
input [3:0]row;
output reg [3:0]col,button;

reg [2:0]state,next_state;
reg [7:0]key;

always @(rst) begin
    state <= S0; next_state <= S0; col <= 4'b1111; button <= 4'b0000;
end

always @(posedge clk) begin
    if(!rst)begin
        state <= next_state;
    end
end

always @(state) begin
    case(state)
        S0: col = 4'b1111;
        S1: col = 4'b0001;
        S2: col = 4'b0010;
        S3: col = 4'b0100;
        S4: col = 4'b1000;
        S5: col = 4'b1111;
        default: col = 4'b1111;
    endcase
end

always @(row or state) begin
    case (state)
        S0: begin
                if(!row) begin
                    next_state <= S0;
                end
                else begin
                    key[7:4] <= row;
                    next_state <= S1;
                end
            end
        S1: begin
                if(!row) begin
                    next_state <= S2;
                end
                else begin
                    key[3:0] <= col;
                    next_state <= S5;
                end
            end
        S2: begin
                if(!row) begin
                    next_state <= S3;
                end
                else begin
                    key[3:0] <= col;
                    next_state <= S5;
                end
            end
        S3: begin
                if(!row) begin
                    next_state <= S4;
                end
                else begin
                    key[3:0] <= col;
                    next_state <= S5;
                end
            end
        S4: begin
                if(!row) begin
                    next_state <= S5;
                end
                else begin
                    key[3:0] <= col;
                    next_state <= S5;
                end
            end 
        S5: begin
                if(!row) begin
                    next_state <= S0;
                end
                else begin
                    next_state <= S5;
                end
            end
    endcase    
end

always @(state == S5) begin
    if(row) begin
        case (key)
            8'b00010001: button <= 4'd0;
            8'b00010010: button <= 4'd1;
            8'b00010100: button <= 4'd2;
            8'b00011000: button <= 4'd3;
            8'b00100001: button <= 4'd4;
            8'b00100010: button <= 4'd5;
            8'b00100100: button <= 4'd6;
            8'b00101000: button <= 4'd7;
            8'b01000001: button <= 4'd8;
            8'b01000010: button <= 4'd9;
            8'b01000100: button <= 4'd10;
            8'b01001000: button <= 4'd11;
            8'b10000001: button <= 4'd12;
            8'b10000010: button <= 4'd13;
            8'b10000100: button <= 4'd14;
            8'b10001000: button <= 4'd15;
            default: button <= 4'd0;
        endcase
    end
end 

endmodule
