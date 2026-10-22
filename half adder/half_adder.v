module ha(
    input a,b,
    output sum,carry
);
assign sum = a ^ b;
assign carry = a & b;

endmodule
module ha_testbench;
reg a, b;
wire sum, carry;
ha ins1(a,b,sum,carry);
initial begin

    $dumpfile("half_adder.vcd");
    $dumpvars(0, ha_testbench);

    $monitor("a=%b b=%b sum=%b carry=%b", a,b,sum,carry);

    a=0; b=0; #10;
    a=0; b=1; #10;
    a=1; b=0; #10;
    a=1; b=1; #10;

    $finish;

end
endmodule