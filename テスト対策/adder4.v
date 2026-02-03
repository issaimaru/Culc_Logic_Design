module adder4(a, b, result);
    input[3:0] a;
    input[3:0] b;
    wire c1, c2, c3;
    output[4:0] result;

    fulladder1 fa1(a[0], b[0], 1'b0, result[0], c1);
    fulladder1 fa2(a[1], b[1], c1, result[1], c2);
    fulladder1 fa3(a[2], b[2], c2, result[2], c3);
    fulladder1 fa4(a[3], b[3], c3, result[3], result[4]);

endmodule