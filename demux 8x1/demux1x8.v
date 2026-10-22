
module demux_1_8(
    input a,
    input s2,
    input s1,
    input s0,
    output y0,
    output y1,
    output y2,
    output y3,
    output y4,
    output y5,
    output y6,
    output y7
);

assign y0 = a & ~s2 & ~s1 & ~s0;
assign y1 = a & ~s2 & ~s1 &  s0;
assign y2 = a & ~s2 &  s1 & ~s0;
assign y3 = a & ~s2 &  s1 &  s0;
assign y4 = a &  s2 & ~s1 & ~s0;
assign y5 = a &  s2 & ~s1 &  s0;
assign y6 = a &  s2 &  s1 & ~s0;
assign y7 = a &  s2 &  s1 &  s0;

endmodule


module demux_1_8_tb;

reg a, s2, s1, s0;
wire y0, y1, y2, y3, y4, y5, y6, y7;

demux_1_8 ins1(
    a, s2, s1, s0,
    y0, y1, y2, y3, y4, y5, y6, y7
);

initial begin
    $dumpfile("demux_1x8.vcd");
    $dumpvars(0, demux_1_8_tb);

    a=0; s2=0; s1=0; s0=0; #10;
    a=1; s2=0; s1=0; s0=0; #10;
    a=1; s2=0; s1=0; s0=1; #10;
    a=1; s2=0; s1=1; s0=0; #10;
    a=1; s2=0; s1=1; s0=1; #10;
    a=1; s2=1; s1=0; s0=0; #10;
    a=1; s2=1; s1=0; s0=1; #10;
    a=1; s2=1; s1=1; s0=0; #10;
    a=1; s2=1; s1=1; s0=1; #10;

    $finish;
end

endmodule
