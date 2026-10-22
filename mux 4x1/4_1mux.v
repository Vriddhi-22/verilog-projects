module mux4x1(
    input i0,i1,i2,i3,
    input s0,s1,
    output y
);

assign y = (~s1 & ~s0 & i0) |
           (~s1 &  s0 & i1) |
           ( s1 & ~s0 & i2) |
           ( s1 &  s0 & i3);

endmodule


module mux4x1_testbench;

reg i0,i1,i2,i3;
reg s0,s1;
wire y;

mux4x1 ins1(i0,i1,i2,i3,s0,s1,y);

initial begin

$dumpfile("mux_4x1.vcd");
$dumpvars(0,mux4x1_testbench);

$monitor("i0=%b i1=%b i2=%b i3=%b s1=%b s0=%b y=%b",
          i0,i1,i2,i3,s1,s0,y);

i0=0;i1=1;i2=0;i3=1;

s1=0;s0=0;#10;
s1=0;s0=1;#10;
s1=1;s0=0;#10;
s1=1;s0=1;#10;

$finish;

end

endmodule