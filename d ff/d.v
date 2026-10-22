
module d_ff(
input D, clk,
output reg Q,
output Qbar
);
assign Qbar = ~Q;
always @(posedge clk) begin
 Q <= D;
end

endmodule

module tb_d_ff;
reg D, clk;
wire Q, Qbar;
d_ff uut (.D(D),.clk(clk),.Q(Q),.Qbar(Qbar));
initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin
$dumpfile("d_ff.vcd");
$dumpvars(0, tb_d_ff);
D=0; #10;
D=1; #10;
D=0; #10;
D=1; #10;
D=1; #10;
D=0; #10;
$finish;
end

endmodule
