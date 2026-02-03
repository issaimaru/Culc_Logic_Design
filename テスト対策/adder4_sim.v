`timescale 1ns/1ns

module adder4_sim;
    reg[3:0] a;
    reg[3:0] b;
    wire[4:0] result;

    adder4 adder4_1(a, b, result);

    initial begin
        a = 4'b0000; b = 4'b0000;
        #100 a = 4'b0001;
        #100 a = 4'b0010;
        #100 b = 4'b0111;
        #100 a = 4'b1101;
        #100 a = 4'b1011;
        #100 $finish;
    end

    initial begin
        $monitor("a = %d, b = %d, result = %d", a, b, result);
        $dumpfile("adder4.vcd");
        $dumpvars;
    end
endmodule