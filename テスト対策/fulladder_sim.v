`timescale 1ns/1ns

module fulladder_sim;
    reg a, b, cin;
    wire s, cout;

    fulladder1 fulladder(a, b, cin, s, cout);

    initial begin
        a = 0; b = 0; cin = 0;
    #100 a = 1; b = 0; cin = 1;
    #100 a = 0; b = 1; cin = 1;
    #100 a = 0; b = 1; cin = 0;
    #100 $finish;
    end

    initial begin
        $monitor("a = %d, b = %d, cin = %d, s = %d, cout = %d", a, b, cin, s, cout);
        $dumpfile("fulladder1.vcd");
        $dumpvars;
    end
endmodule
