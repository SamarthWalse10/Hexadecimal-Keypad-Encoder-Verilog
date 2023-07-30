`timescale 1ns / 1ps


module hex_4x4_keypad_encoder #(parameter S0 = 3'd0, parameter S1 = 3'd1, parameter S2 = 3'd2, parameter S3 = 3'd3, parameter S4 = 3'd4, parameter S5 = 3'd5)(
    input clk,rst,
    input [3:0]row,
    output reg [3:0]col,button
);

reg [2:0]state,next_state;
reg [7:0]key;

initial begin
    state = S0; next_state = S0;
    col = 4'd15;
end

always @(posedge clk or posedge rst) begin
    if (rst == 1'b1) begin
        state = S0;
    end
    else begin
        state = next_state;
    end
end

always @(state) begin
    case (state)
        S0: col = 4'd15;
        S1: col = 4'd1;
        S2: col = 4'd2;
        S3: col = 4'd4;
        S4: col = 4'd8;
        S5: col = 4'd15;
        default: col = 4'd15;
    endcase
end

// always @(state or row) begin
//     case (state)
//         S0: begin
//                 if (row) begin
//                     key[7:4] = row;
//                     next_state = S1;
//                 end
//                 else begin
//                     next_state = S0;
//                 end
//             end
//         S1: begin
//                 if (!row) begin
//                     next_state = S2;
//                 end
//                 else begin
//                     key[3:0] = col;
//                     next_state = S5;
//                 end
//             end
//         S2: begin
//                 if (!row) begin
//                     next_state = S3;
//                 end
//                 else begin
//                     key[3:0] = col;
//                     next_state = S5;
//                 end
//             end
//         S3: begin
//                 if (!row) begin
//                     next_state = S4;
//                 end
//                 else begin
//                     key[3:0] = col;
//                     next_state = S5;
//                 end
//             end
//         S4: begin
//                 if (!row) begin
//                     next_state = S5;
//                 end
//                 else begin
//                     key[3:0] = col;
//                     next_state = S5;
//                 end
//             end
//         S5: begin
//                 if (!row) begin
//                     next_state = S0;
//                 end
//                 else begin
//                     next_state = S5;
//                 end
//             end
//         // default: next_state = S0;
//     endcase
// end

always @(state or row) begin
    case (state)
        S0: begin
                if (row) begin
                    key[7:4] = row;
                    next_state = S1;
                end
            end 
        S5: begin
                if (!row) begin
                    next_state = S0;
                end
                else begin
                    next_state = S5;
                end
            end
    endcase
end

always @(state) begin
    case (state)
        S0: if (row == 4'd0) begin
                next_state = S0;
            end
        S1: begin
                 if (!row) begin
                    next_state = S2;
                end
                else begin
                    key[3:0] = col;
                    next_state = S5;
                end     
            end
        S2: begin
                if (!row) begin
                    next_state = S3;
                end
                else begin
                    key[3:0] = col;
                    next_state = S5;
                end
            end
        S3: begin
                if (!row) begin
                    next_state = S4;
                end
                else begin
                    key[3:0] = col;
                    next_state = S5;
                end
            end
        S4: begin
                if (!row) begin
                    next_state = S5;
                end
                else begin
                    key[3:0] = col;
                    next_state = S5;
                end
            end
    endcase
end

always @(state == S5) begin
    if (row) begin
        case (key)
            8'b00010001: button = 4'd0;
            8'b00010010: button = 4'd1;
            8'b00010100: button = 4'd2;
            8'b00011000: button = 4'd3;
            8'b00100001: button = 4'd4;
            8'b00100010: button = 4'd5;
            8'b00100100: button = 4'd6;
            8'b00101000: button = 4'd7;
            8'b01000001: button = 4'd8;
            8'b01000010: button = 4'd9;
            8'b01000100: button = 4'd10;
            8'b01001000: button = 4'd11;
            8'b10000001: button = 4'd12;
            8'b10000010: button = 4'd13;
            8'b10000100: button = 4'd14;
            8'b10001000: button = 4'd15;
            8'b00001111: button = 4'dx;
        endcase
    end
end

endmodule
