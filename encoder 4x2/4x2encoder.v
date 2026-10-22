module encoder4x2(
    input i0,i1,i2,i3,en,
    output y0,y1
);

assign y1 = en & (i2 | i3);
assign y0 = en & (i1 | i3);

endmodule


module encoder_testbench;

reg i0,i1,i2,i3,en;
wire y0,y1;

encoder4x2 ins1(i0,i1,i2,i3,en,y0,y1);

initial begin

$dumpfile("encoder_4x2.vcd");
$dumpvars(0,encoder_testbench);

$monitor("en=%b i0=%b i1=%b i2=%b i3=%b y1=%b y0=%b",
          en,i0,i1,i2,i3,y1,y0);

en=0;i0=0;i1=0;i2=0;i3=0;#10;

en=1;i0=1;i1=0;i2=0;i3=0;#10;
en=1;i0=0;i1=1;i2=0;i3=0;#10;
en=1;i0=0;i1=0;i2=1;i3=0;#10;
en=1;i0=0;i1=0;i2=0;i3=1;#10;

$finish;

end

endmodule