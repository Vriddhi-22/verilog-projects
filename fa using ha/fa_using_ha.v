module fa_using_ha(
    input a,b,cin,
    output sum,carry);
wire w1,w2,w3;
half_adder HA1(a,b,w1,w2);
half_adder HA2(w1,cin,sum,w3);
or OR1(carry,w2,w3);
endmodule

module half_adder(
    input a,b,
    output sum,carry
);
assign sum=a^b;
assign carry=a&b;
endmodule

module tb;
reg a,b,cin;
wire sum,carry;
 fa_using_ha ins1(a,b,cin,sum,carry);
initial begin

    $dumpfile("fa_using_ha.vcd");
    $dumpvars(0,tb);

    $monitor("a=%b b=%b cin=%b sum=%b carry=%b", a,b,cin,sum,carry);

    a=0; b=0; cin=0;#10;
    a=0; b=0; cin=1;#10;
    a=0; b=1; cin=0;#10;
    a=0; b=1; cin=1;#10;
    a=1; b=0; cin=0;#10;
    a=1; b=0; cin=1;#10;
    a=1; b=1; cin=0;#10;
    a=1; b=1; cin=1;#10;

    $finish;

end
endmodule