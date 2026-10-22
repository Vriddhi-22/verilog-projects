
`timescale 1ns/1ps

module encoder8x3(
    input [7:0] I,
    output reg [2:0] Y
);

always @(*) begin
    casex (I)
        8'b1xxxxxxx: Y = 3'b111;
        8'b01xxxxxx: Y = 3'b110;
        8'b001xxxxx: Y = 3'b101;
        8'b0001xxxx: Y = 3'b100;
        8'b00001xxx: Y = 3'b011;
        8'b000001xx: Y = 3'b010;
        8'b0000001x: Y = 3'b001;
        8'b00000001: Y = 3'b000;
        default:     Y = 3'b000;
    endcase
end

endmodule


module encoder8x3_tb;

reg [7:0] I;
wire [2:0] Y;

encoder8x3 ins1(I, Y);

initial begin
    $dumpfile("encoder8x3.vcd");
    $dumpvars(0, encoder8x3_tb);

    I = 8'b00000000; #10;
    I = 8'b00000001; #10;
    I = 8'b00000010; #10;
    I = 8'b00000100; #10;
    I = 8'b00001000; #10;
    I = 8'b00010000; #10;
    I = 8'b00100000; #10;
    I = 8'b01000000; #10;
    I = 8'b10000000; #10;

    // Multiple inputs HIGH to test priority
    I = 8'b00100100; #10;
    I = 8'b10100010; #10;
    I = 8'b11111111; #10;

    $finish;
end

endmodule
