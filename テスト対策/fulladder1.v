module fulladder1 (a, b, cin, s, cout);
    input a, b, cin;
    wire s1, c1, c2;
    output s, cout;

    HalfAdder ha1(a, b, s1, c1);
    HalfAdder ha2(cin, s1, s, c2);

    assign cout = c1 | c2;
endmodule
