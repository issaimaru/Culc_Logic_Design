`timescale 1ns/1ns

module HalfAdderSim;
    reg a, b;
    wire sum, carry;
    HalfAdder half(a, b, sum, carry);

    initial begin
        a = 0; b = 0;
    #100 a = 1;
    #100 a = 0; b = 1;
    #100 a = 1;
    #100 a = 0; b = 0;
    #100 $finish;
    end

    initial begin
        $monitor("a=%d, b=%d, s=%d, c=%d", a, b, sum, carry);
        $dumpfile("halfadder.vcd");
        $dumpvars;
    end
    
endmodule
