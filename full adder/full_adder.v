module fa(
    input a,b,cin,
    output sum,carry
);

assign sum = a ^ b ^ cin;
assign carry = (a & b) | (b & cin) | (a & cin);

endmodule


module fa_testbench;

reg a,b,cin;
wire sum,carry;

fa ins1(a,b,cin,sum,carry);

initial begin

$dumpfile("full_adder.vcd");
$dumpvars(0, fa_testbench);

$monitor("a=%b b=%b cin=%b sum=%b carry=%b",
          a,b,cin,sum,carry);

a=0;b=0;cin=0;#10;
a=0;b=0;cin=1;#10;
a=0;b=1;cin=0;#10;
a=0;b=1;cin=1;#10;
a=1;b=0;cin=0;#10;
a=1;b=0;cin=1;#10;
a=1;b=1;cin=0;#10;
a=1;b=1;cin=1;#10;

$finish;

end
endmodule