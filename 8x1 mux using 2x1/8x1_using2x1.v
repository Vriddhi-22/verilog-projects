
module mux8x1(
    input I0, I1, I2, I3, I4, I5, I6, I7,
    input S0, S1, S2,
    output Y
);

    wire w0, w1, w2, w3, w4, w5;

    // First stage
    mux2x1 m1(I0, I1, S0, w0);
    mux2x1 m2(I2, I3, S0, w1);
    mux2x1 m3(I4, I5, S0, w2);
    mux2x1 m4(I6, I7, S0, w3);

    // Second stage
    mux2x1 m5(w0, w1, S1, w4);
    mux2x1 m6(w2, w3, S1, w5);

    // Final stage
    mux2x1 m7(w4, w5, S2, Y);

endmodule


module mux2x1(
    input A, B, S,
    output Y
);

    assign Y = S ? B : A;

endmodule


module tb_mux8x1;

    reg I0, I1, I2, I3, I4, I5, I6, I7;
    reg S0, S1, S2;
    wire Y;

    mux8x1 uut (
        .I0(I0), .I1(I1), .I2(I2), .I3(I3),
        .I4(I4), .I5(I5), .I6(I6), .I7(I7),
        .S0(S0), .S1(S1), .S2(S2),
        .Y(Y)
    );

    initial begin
        $dumpfile("mux8x1.vcd");
        $dumpvars(0, tb_mux8x1);

        I0=0; I1=1; I2=0; I3=1;
        I4=1; I5=0; I6=0; I7=1;

        {S2,S1,S0}=3'b000; #10;
        {S2,S1,S0}=3'b001; #10;
        {S2,S1,S0}=3'b010; #10;
        {S2,S1,S0}=3'b011; #10;
        {S2,S1,S0}=3'b100; #10;
        {S2,S1,S0}=3'b101; #10;
        {S2,S1,S0}=3'b110; #10;
        {S2,S1,S0}=3'b111; #10;

        $finish;
    end

endmodule
