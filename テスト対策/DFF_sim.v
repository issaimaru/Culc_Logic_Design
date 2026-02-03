`timescale 1ns/1ns

module DFF_sim;
    reg d, clk;
    wire q;

    DFF dff1(clk, d, q);

    initial begin
        clk = 0;
        forever begin
            #50 clk=~clk;
        end
    end

    initial begin
        d = 0;
        #100 d = 1;
        #100 d = 0;
        #100 $finish;
    end

    initial begin
        $monitor("clk = %d, d = %d, q = %d", clk, d, q);
        $dumpfile("DFF_sim.vcd");
        $dumpvars;
    end
endmodule
