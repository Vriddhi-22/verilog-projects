module fs(
    input a,b,bin,
    output diff,borrow
);

assign diff = a ^ b ^ bin;
assign borrow = (~a & b) | (~a & bin) | (b & bin);

endmodule


module fs_testbench;

reg a,b,bin;
wire diff,borrow;

fs ins1(a,b,bin,diff,borrow);

initial begin

$dumpfile("full_subtractor.vcd");
$dumpvars(0, fs_testbench);

$monitor("a=%b b=%b bin=%b diff=%b borrow=%b",
          a,b,bin,diff,borrow);

a=0;b=0;bin=0;#10;
a=0;b=0;bin=1;#10;
a=0;b=1;bin=0;#10;
a=0;b=1;bin=1;#10;
a=1;b=0;bin=0;#10;
a=1;b=0;bin=1;#10;
a=1;b=1;bin=0;#10;
a=1;b=1;bin=1;#10;

$finish;

end

endmodule