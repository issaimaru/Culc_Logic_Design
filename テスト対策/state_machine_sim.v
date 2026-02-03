`timescale 1ns/1ns

module state_machine_sim;
    reg clk, run, halt, reset;
    wire [1:0] cs;

    state_machine state_machine1(clk, run, halt, reset, cs);

    initial begin
        clk = 0;
        forever begin
            #50 clk = ~clk;
        end
    end

    initial begin
        run = 0; halt = 0; reset = 0;
        #1 reset = 1;
        #100 run = 1;
        #200 run = 0; halt = 1;
        #500 halt = 0; run = 1;
        #1000 reset = 0;
        #100 $finish;
    end

    initial begin
        $monitor("clk = %d, run = %d, halt = %d, reset = %d, cs = %d", clk, run, halt, reset, cs);
        $dumpfile("state_machine_sim.vcd");
        $dumpvars;
    end
endmodule