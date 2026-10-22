module mux6x1(
    input I0, I1, I2, I3, I4, I5,
    input S0, S1, S2,
    output Y
);

    wire w0, w1, w2, w3;

    // First stage
    mux2x1 m1(I0, I1, S0, w0);
    mux2x1 m2(I2, I3, S0, w1);

    // Second stage
    mux2x1 m3(w0, w1, S1, w2);

    // Select between I4 and I5
    mux2x1 m4(I4, I5, S0, w3);

    // Final output
    mux2x1 m5(w2, w3, S2, Y);

endmodule

module mux2x1(
    input A, B, S,
    output Y
);
    assign Y = S ? B : A;
endmodule

module tb_mux6x1;

    reg I0, I1, I2, I3, I4, I5;
    reg S0, S1, S2;
    wire Y;

    mux6x1 uut (
        .I0(I0), .I1(I1), .I2(I2),
        .I3(I3), .I4(I4), .I5(I5),
        .S0(S0), .S1(S1), .S2(S2),
        .Y(Y)
    );

initial begin
    $dumpfile("mux6x1.vcd");
    $dumpvars(0, tb_mux6x1);

    I0=0; I1=1; I2=0;
    I3=1; I4=1; I5=0;

    S2=0; S1=0; S0=0; #10;
    S2=0; S1=0; S0=1; #10;
    S2=0; S1=1; S0=0; #10;
    S2=0; S1=1; S0=1; #10;
    S2=1; S1=0; S0=0; #10;
    S2=1; S1=0; S0=1; #10;

    $finish;
end
endmodule