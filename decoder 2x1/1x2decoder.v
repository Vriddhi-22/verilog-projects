module decoder(
    input a,en,
    output y0,y1
);

assign y0 = en & ~a;
assign y1 = en & a;

endmodule


module decoder_testbench;

reg a,en;
wire y0,y1;

decoder ins1(a,en,y0,y1);

initial begin

$dumpfile("decoder_1x2.vcd");
$dumpvars(0, decoder_testbench);

$monitor("en=%b a=%b y0=%b y1=%b",
          en,a,y0,y1);

en=0; a=0; #10;
en=0; a=1; #10;

en=1; a=0; #10;
en=1; a=1; #10;

$finish;

end

endmodule