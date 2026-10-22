module mux(
    input i0,i1,sel,
    output y
);

assign y = (~sel & i0) | (sel & i1);

endmodule


module mux_testbench;

reg i0,i1,sel;
wire y;

mux ins1(i0,i1,sel,y);

initial begin

$dumpfile("mux_2x1.vcd");
$dumpvars(0, mux_testbench);

$monitor("i0=%b i1=%b sel=%b y=%b",
          i0,i1,sel,y);

i0=0;i1=0;sel=0;#10;
i0=0;i1=1;sel=0;#10;
i0=1;i1=0;sel=0;#10;
i0=1;i1=1;sel=0;#10;

i0=0;i1=0;sel=1;#10;
i0=0;i1=1;sel=1;#10;
i0=1;i1=0;sel=1;#10;
i0=1;i1=1;sel=1;#10;

$finish;

end

endmodule