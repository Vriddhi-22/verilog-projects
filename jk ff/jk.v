module jk_ff(
    input j,k,clk,
    output reg Q,
    output Qbar
);
assign Qbar = ~Q;

always @(posedge clk) begin
case ({j, k})
  2'b00: Q <= Q;    // Hold
  2'b01: Q <= 1'b0;  // Reset
  2'b10: Q <= 1'b1;  // Set
  2'b11: Q <= ~Q;  // Invalid condition
endcase
end

endmodule

module tb_jk_ff;
reg j, k, clk;
wire Q, Qbar;

jk_ff uut (.j(j),.k(k),.clk(clk),.Q(Q),.Qbar(Qbar));

initial begin

clk=0;
forever #5 clk = ~clk;
end

initial begin
$dumpfile("jk_ff.vcd");
$dumpvars(0, tb_jk_ff);
j=0; k=1; #10;  //Reset    
j=1; k=0; #10;  // Set
j=0; k=0; #10;  // Hold
j=0; k=1; #10;  // Reset
j=0; k=0; #10;  // Hold
j=1; k=1; #10;  // Invalid


$finish;

end

endmodule