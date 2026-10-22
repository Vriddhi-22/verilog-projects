module encoder(
    input i0,i1,en,
    output y
);

assign y = en & i1;

endmodule


module encoder_testbench;

reg i0,i1,en;
wire y;

encoder ins1(i0,i1,en,y);

initial begin

$dumpfile("encoder_2x1.vcd");
$dumpvars(0, encoder_testbench);

$monitor("en=%b i0=%b i1=%b y=%b",
          en,i0,i1,y);

en=0;i0=0;i1=0;#10;
en=0;i0=0;i1=1;#10;

en=1;i0=0;i1=0;#10;
en=1;i0=1;i1=0;#10;
en=1;i0=0;i1=1;#10;

$finish;

end

endmodule