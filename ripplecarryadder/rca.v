
module ripple_carry_adder(
    input [3:0]A,
    input [3:0]B,
    input Cin,
    output [3:0]Sum,
    output Cout
);

    wire c1, c2, c3;

    // Four full adders connected in series
    full_adder fa0(A[0],B[0],Cin,Sum[0],c1);
    full_adder fa1(A[1],B[1],c1,Sum[1],c2);
    full_adder fa2(A[2],B[2],c2,Sum[2],c3);
    full_adder fa3(A[3],B[3],c3,Sum[3],Cout);

endmodule


module full_adder(
    input A,B,Cin,
    output Sum,Cout
);

    assign Sum = A^B^Cin;
    assign Cout = (A&B)|(A&Cin)|(B&Cin);

endmodule


module tb_ripple_carry_adder;

    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;

    ripple_carry_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        $dumpfile("ripple_carry_adder.vcd");
        $dumpvars(0, tb_ripple_carry_adder);

        A=4'b0000; B=4'b0000; Cin=0; #10;
        A=4'b0011; B=4'b0010; Cin=0; #10;
        A=4'b0101; B=4'b0011; Cin=0; #10;
        A=4'b0111; B=4'b0001; Cin=0; #10;
        A=4'b1111; B=4'b0001; Cin=0; #10;
        A=4'b1010; B=4'b0101; Cin=1; #10;

        $finish;
    end

endmodule

