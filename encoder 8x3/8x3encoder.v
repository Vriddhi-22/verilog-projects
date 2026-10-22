
module encoder8x3(
    input [7:0] I,
    output reg [2:0] Y
);

always @(*) begin
    case (I)
        8'b00000001: Y = 3'b000;
        8'b00000010: Y = 3'b001;
        8'b00000100: Y = 3'b010;
        8'b00001000: Y = 3'b011;
        8'b00010000: Y = 3'b100;
        8'b00100000: Y = 3'b101;
        8'b01000000: Y = 3'b110;
        8'b10000000: Y = 3'b111;

        default: Y = 3'b000;
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

    I = 8'b00000001; #10;
    I = 8'b00000010; #10;
    I = 8'b00000100; #10;
    I = 8'b00001000; #10;
    I = 8'b00010000; #10;
    I = 8'b00100000; #10;
    I = 8'b01000000; #10;
    I = 8'b10000000; #10;

    $finish;
end

endmodule
