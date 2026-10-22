module mux8x1(
    input i0,i1,i2,i3,i4,i5,i6,i7,
    input s0,s1,s2,
    output y
);
assign y=(~s0&~s1&~s2&i0)|
         (~s0&~s1&s2&i1)|
         (~s0&s1&~s2&i2)|
         (~s0&s1&s2&i3)|
         (s0&~s1&~s2&i4)|
         (s0&~s1&s2&i5)|
         (s0&s1&~s2&i6)|
         (s0&s1&s2&i7);
endmodule
module mux8x1_tb;
reg i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2;
wire y;
mux8x1 ins1(i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,y);
initial begin

$dumpfile("8x1mux.vcd");
$dumpvars(0,mux8x1_tb);
$monitor("i0=%b i1=%b i2=%b i3=%b i4=%b i5=%b i6=%b i7=%b s1=%b s0=%b s2=%b y=%b",
          i0,i1,i2,i3,i4,i5,i6,i7,s1,s0,s2,y);

i0=0; i1=0; i2=0; i3=0;
i4=0; i5=0; i6=0; i7=0;


s0=0;s1=0;s2=0;i0=1;#5;
s0=0;s1=0;s2=1;i1=1;#5;
s0=0;s1=1;s2=0;i2=1;#5;
s0=0;s1=1;s2=1;i3=1;#5;
s0=1;s1=0;s2=0;i4=1;#5;
s0=1;s1=0;s2=1;i5=1;#5;
s0=1;s1=1;s2=0;i6=1;#5;
s0=1;s1=1;s2=1;i7=1;#5;
$finish;

end

endmodule
