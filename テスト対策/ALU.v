`define ADD 5'b00000
`define SUB 5'b00001
`define MUL 5'b00010
`define SHL 5'b00011
`define SHR 5'b00100
`define BAND 5'b00101
`define BOR 5'b00110
`define BXOR 5'b00111
`define AND 5'b01000
`define OR 5'b01001
`define EQ 5'b01010
`define NE 5'b01011
`define GE 5'b01100
`define LE 5'b01101
`define GT 5'b01110
`define LT 5'b01111
`define NEG 5'b10000
`define BNOT 5'b10001
`define NOT 5'b10010

module ALU(a, b, f, s);
    input [15:0] a, b;
    input [4:0] f;
    output [15:0] s;
    wire [15:0] x,y;
    assign x = a + 16'h8000;
    assign y = b + 16'h8000;

    function [15:0] alu;
        input [15:0] a, b;
        input [4:0] f;
        input [15:0] x,y;

        case (f)
            `ADD : alu = b + a;
            `SUB : alu = b - a;
            `MUL : alu = b * a;
            `SHL : alu = b << a;
            `SHR : alu = b >> a;
            `BAND : alu = b & a;
            `BOR : alu = a | b;
            `BXOR : alu = b ^ a;
            `AND : alu = b && a;
            `OR : alu = b || a;
            `EQ : alu = b == a;
            `NE : alu = b != a;
            `GE : alu = x >= y;
            `LE : alu = x <= y;
            `GT : alu = x > y;
            `LT : alu = x < y;
            `NEG : alu = -a;
            `BNOT : alu = ~a;
            `NOT : alu = !a;
            default : alu = 16'hxxxx;
        endcase
    endfunction
    assign s = alu(a, b, f, x, y);
endmodule
