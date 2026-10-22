
module decoder2x4(
    input I0, I1,
    output reg [3:0] a
);

always @(*) begin
    case ({I1, I0})
        2'b00: a = 4'b0001;
        2'b01: a = 4'b0010;
        2'b10: a = 4'b0100;
        2'b11: a = 4'b1000;
        default: a = 4'b0000;
    endcase
end

endmodule


module decoder2x4_tb;

reg I0, I1;
wire [3:0] a;

decoder2x4 ins1 (
    .I0(I0),
    .I1(I1),
    .a(a)
);

initial begin
    $dumpfile("decoder2x4.vcd");
    $dumpvars(0, decoder2x4_tb);

    I1 = 0; I0 = 0; #10;
    I1 = 0; I0 = 1; #10;
    I1 = 1; I0 = 0; #10;
    I1 = 1; I0 = 1; #10;

    $finish;
end

endmodule
