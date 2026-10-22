
module alu(
input [3:0] A, B,
input [2:0] sel,
output reg [3:0] Y,
output reg carry);

always @(*) begin
    Y = 4'b0000;
    carry = 1'b0;

case (sel)
 3'b000: {carry, Y} = {1'b0, A} + {1'b0, B}; // Addition
 3'b001: Y = A - B;                         // Subtraction
 3'b010: Y = A & B;                         // AND
 3'b011: Y = A | B;                         // OR
 3'b100: Y = A ^ B;                         // XOR
 3'b101: Y = ~A;                            // NOT A
 3'b110: Y = A << 1;                        // Left shift
 3'b111: Y = A >> 1;                        // Right shift
default: begin
Y = 4'b0000;
carry = 1'b0;
end
endcase
end

endmodule


module tb_alu;

reg [3:0] A, B;
reg [2:0] sel;
wire [3:0] Y;
wire carry;

alu uut (.A(A),.B(B),.sel(sel),.Y(Y),.carry(carry));

initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, tb_alu);

// Addition
 A = 4'b0101; B = 4'b0011; sel = 3'b000; #10;

// Subtraction
A = 4'b1000; B = 4'b0011; sel = 3'b001; #10;

// AND
A = 4'b1100; B = 4'b1010; sel = 3'b010; #10;

// OR
A = 4'b1100; B = 4'b1010; sel = 3'b011; #10;

// XOR
A = 4'b1100; B = 4'b1010; sel = 3'b100; #10;

 // NOT A
A = 4'b1010; B = 4'b0000; sel = 3'b101; #10;

// Left shift
A = 4'b0011; B = 4'b0000; sel = 3'b110; #10;

// Right shift
A = 4'b1100; B = 4'b0000; sel = 3'b111; #10;

$finish;
end

endmodule
