
module carry_lookahead_adder(
    input [3:0] A, B,
    input Cin,
    output [3:0] Sum,
    output Cout
);

    wire [3:0] P, G;
    wire C1, C2, C3;

    // Propagate and Generate
    assign P = A ^ B;
    assign G = A & B;

    // Carry Look-Ahead equations
    assign C1 = G[0] | (P[0] & Cin);

    assign C2 = G[1] |
                (P[1] & G[0]) |
                (P[1] & P[0] & Cin);

    assign C3 = G[2] |
                (P[2] & G[1]) |
                (P[2] & P[1] & G[0]) |
                (P[2] & P[1] & P[0] & Cin);

    assign Cout = G[3] |
                  (P[3] & G[2]) |
                  (P[3] & P[2] & G[1]) |
                  (P[3] & P[2] & P[1] & G[0]) |
                  (P[3] & P[2] & P[1] & P[0] & Cin);

    // Sum outputs
    assign Sum[0] = P[0] ^ Cin;
    assign Sum[1] = P[1] ^ C1;
    assign Sum[2] = P[2] ^ C2;
    assign Sum[3] = P[3] ^ C3;

endmodule


module tb_carry_lookahead_adder;

    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;

    carry_lookahead_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        $dumpfile("carry_lookahead_adder.vcd");
        $dumpvars(0, tb_carry_lookahead_adder);

        A=4'b0000; B=4'b0000; Cin=0; #10;
        A=4'b0011; B=4'b0010; Cin=0; #10;
        A=4'b0101; B=4'b0011; Cin=0; #10;
        A=4'b0111; B=4'b0001; Cin=0; #10;
        A=4'b1111; B=4'b0001; Cin=0; #10;
        A=4'b1010; B=4'b0101; Cin=1; #10;

        $finish;
    end

endmodule
