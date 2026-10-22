
module t_ff(
input T, clk,
output reg Q,
output Qbar
);
assign Qbar = ~Q;
initial begin
    Q = 0;
end
always @(posedge clk) begin
 if (T == 1'b1)
    Q <= ~Q;
 else
    Q <= Q;
end


endmodule

module tb_t_ff;
reg T, clk;
wire Q, Qbar;
t_ff uut (.T(T),.clk(clk),.Q(Q),.Qbar(Qbar));
initial begin
clk = 0;
forever #5 clk = ~clk;
end

initial begin
$dumpfile("t_ff.vcd");
$dumpvars(0, tb_t_ff);
T=0; #10;
T=1; #10;
T=0; #10;
T=1; #10;
T=1; #10;
T=0; #10;
$finish;
end

endmodule
