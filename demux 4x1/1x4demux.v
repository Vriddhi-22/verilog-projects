module demux_1_4(
    input a,
    input s1,
    input s0,
    output y0,
    output y1,
    output y2,
    output y3
);

assign y0 = a & ~s1 & ~s0;
assign y1 = a & ~s1 &  s0;
assign y2 = a &  s1 & ~s0;
assign y3 = a &  s1 &  s0;

endmodule

module demux_1_4_tb;

reg a, s1, s0;
wire y0, y1, y2, y3;

demux_1_4 ins1(a, s1, s0, y0, y1, y2, y3);

initial begin

    $dumpfile("demux_1x4.vcd");
    $dumpvars(0, demux_1_4_tb);

    $monitor("a=%b s1=%b s0=%b y0=%b y1=%b y2=%b y3=%b",
              a,s1,s0,y0,y1,y2,y3);

    a=0; s1=0; s0=0; #10;
    a=1; s1=0; s0=0; #10;
    a=1; s1=0; s0=1; #10;
    a=1; s1=1; s0=0; #10;
    a=1; s1=1; s0=1; #10;

    $finish;

end

endmodule