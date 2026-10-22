
module keypad_access_system(
    input clk,
    input reset,
    input [3:0] key,
    output [3:0] indicator,
    output unlock,
    output error
);

wire [1:0] code;
wire valid;

encoder enc (
    .key(key),
    .code(code),
    .valid(valid)
);

access_controller fsm (
    .clk(clk),
    .reset(reset),
    .code(code),
    .valid(valid),
    .unlock(unlock),
    .error(error)
);

decoder dec (
    .code(code),
    .enable(valid),
    .indicator(indicator)
);

endmodule


// 4-to-2 Encoder
module encoder(
    input [3:0] key,
    output reg [1:0] code,
    output reg valid
);

always @(*) begin
    code = 2'b00;
    valid = 1'b1;

    case (key)
        4'b0001: code = 2'b00; // K0
        4'b0010: code = 2'b01; // K1
        4'b0100: code = 2'b10; // K2
        4'b1000: code = 2'b11; // K3

        default: begin
            code = 2'b00;
            valid = 1'b0;
        end
    endcase
end

endmodule


// Access Controller FSM
//SEQUENCE IS K1->K3->K0->K2

module access_controller(
    input clk,
    input reset,
    input [1:0] code,
    input valid,
    output reg unlock,
    output reg error
);

parameter S0 = 3'd0,
          S1 = 3'd1,
          S2 = 3'd2,
          S3 = 3'd3,
          S4 = 3'd4;

reg [2:0] state;
reg key_ready;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= S0;
        key_ready <= 1'b1;
        error <= 1'b0;
    end
    else begin
        error <= 1'b0;

        // Wait for key release before accepting another key
        if (!valid) begin
            key_ready <= 1'b1;
        end
        else if (key_ready && state != S4) begin
            key_ready <= 1'b0;

            case (state)
                S0: begin
                    if (code == 2'b01)
                        state <= S1;
                    else begin
                        state <= S0;
                        error <= 1'b1;
                    end
                end

                S1: begin
                    if (code == 2'b11)
                        state <= S2;
                    else begin
                        state <= S0;
                        error <= 1'b1;
                    end
                end

                S2: begin
                    if (code == 2'b00)
                        state <= S3;
                    else begin
                        state <= S0;
                        error <= 1'b1;
                    end
                end

                S3: begin
                    if (code == 2'b10)
                        state <= S4;
                    else begin
                        state <= S0;
                        error <= 1'b1;
                    end
                end

                default: state <= S0;
            endcase
        end
    end
end

always @(*) begin
    unlock = (state == S4);
end

endmodule



// 2-to-4 Decoder
module decoder(
    input [1:0] code,
    input enable,
    output reg [3:0] indicator
);

always @(*) begin
    indicator = 4'b0000;

    if (enable) begin
        case (code)
            2'b00: indicator = 4'b0001;
            2'b01: indicator = 4'b0010;
            2'b10: indicator = 4'b0100;
            2'b11: indicator = 4'b1000;

            default: indicator = 4'b0000;
        endcase
    end
end

endmodule




module tb_keypad_access_system;

reg clk;
reg reset;
reg [3:0] key;

wire [3:0] indicator;
wire unlock;
wire error;

keypad_access_system uut (
    .clk(clk),
    .reset(reset),
    .key(key),
    .indicator(indicator),
    .unlock(unlock),
    .error(error)
);

// Clock generation
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("smart.vcd");
    $dumpvars(0, tb_keypad_access_system);

    // Reset the system
    reset = 1'b1;
    key = 4'b0000;
    #25;
    reset = 1'b0;
    #25;

    // Correct password: K1 -> K3 -> K0 -> K2

    key = 4'b0010;  // K1
    #25;
    key = 4'b0000;  // Release key
    #25;

    key = 4'b1000;  // K3
    #25;
    key = 4'b0000;
    #25;

    key = 4'b0001;  // K0
    #25;
    key = 4'b0000;
    #25;

    key = 4'b0100;  // K2
    #25;
    key = 4'b0000;
    #25;

    // Reset and test an incorrect key
    reset = 1'b1;
    #25;
    reset = 1'b0;
    #25;

    key = 4'b0100;  // K2 is incorrect as the first key
    #25;
    key = 4'b0000;
    #25;

    $finish;
end

endmodule
