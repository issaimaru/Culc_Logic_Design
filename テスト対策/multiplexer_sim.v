`timescale 1ns/1ns

module multiplexer_sim;
    reg a, b, c;
    reg[1:0] f;
    wire s;

    multiplexer multiplex1(a, b, c, f, s);

    initial begin
        forever begin
            a = 0; b = 0; c = 0;
            #10 a = 1;
            #10 a = 0; b = 1;
            #10 b = 0; c = 1;
            #10 ;
        end
    end

    initial begin
        f = 2'b00;
        #40 f = 2'b01;
        #40 f = 2'b10;
        #40 f = 2'b00;
        #40 $finish;
    end

    initial begin
        $monitor("a = %d, b = %d, c = %d, f = %d, s = %d",a, b, c, f, s);
        $dumpfile("multiplexer_sim.vcd");
        $dumpvars;
    end

endmodule