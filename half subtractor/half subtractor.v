module hs(
    input a,b,
    output diff,borrow
);

assign diff = a ^ b;
assign borrow = (~a & b);

endmodule


module hs_testbench;

reg a,b;
wire diff,borrow;

hs ins1(a,b,diff,borrow);

initial begin

$dumpfile("half_subtractor.vcd");
$dumpvars(0, hs_testbench);

$monitor("a=%b b=%b diff=%b borrow=%b",
          a,b,diff,borrow);

a=0;b=0;#10;
a=0;b=1;#10;
a=1;b=0;#10;
a=1;b=1;#10;

$finish;

end

endmodule