module sr_ff(
    input S,R,clk,
    output reg Q,
    output Qbar
);
assign Qbar = ~Q;

always @(posedge clk) begin
case ({S, R})
  2'b00: Q <= Q;    // Hold
  2'b01: Q <= 1'b0;  // Reset
  2'b10: Q <= 1'b1;  // Set
  2'b11: Q <= 1'bx;  // Invalid condition
endcase
end

endmodule

module tb_sr_ff;
reg S, R, clk;
wire Q, Qbar;

sr_ff uut (.S(S),.R(R),.clk(clk),.Q(Q),.Qbar(Qbar));

initial begin

clk=0;
forever #5 clk = ~clk;
end

initial begin
$dumpfile("sr_ff.vcd");
$dumpvars(0, tb_sr_ff);
S=0; R=1; #10;  //Reset    
S=1; R=0; #10;  // Set
S=0; R=0; #10;  // Hold
S=0; R=1; #10;  // Reset
S=0; R=0; #10;  // Hold
S=1; R=1; #10;  // Invalid


$finish;

end

endmodule