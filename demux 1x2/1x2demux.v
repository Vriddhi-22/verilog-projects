module demux_1_2(
    input a,
    input s0,
    output y0,
    output y1
);

assign y0 = a & ~s0;
assign y1 = a & s0;

endmodule
module demux_1_2_tb;

reg a, s0;
wire y0, y1;

demux_1_2 ins1(a, s0, y0, y1);

initial begin

    $dumpfile("demux_1x2.vcd");
    $dumpvars(0, demux_1_2_tb);

    $monitor("a=%b s0=%b y0=%b y1=%b",
              a, s0, y0, y1);

    a=0; s0=0; #10;
    a=0; s0=1; #10;
    a=1; s0=0; #10;
    a=1; s0=1; #10;

    $finish;

end

endmodule