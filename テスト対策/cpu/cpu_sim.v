`timescale 1ns / 1ns

module cpu_sim;
    reg clk, reset;
    wire clk_ft, clk_dc, clk_ex, clk_wb;
    wire [7:0] p_count, op_data;
    wire [14:0] p_out;
    wire [3:0] op_code;
    wire [15:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7;
    wire [2:0] n_reg_a, n_reg_b;
    wire [15:0] reg_a, reg_b, reg_in;

    cpu cpuSIM(clk, reset, clk_ft, clk_dc, clk_ex, clk_wb, p_count, p_out, op_code, op_data, reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, n_reg_a, reg_a, n_reg_b, reg_b, reg_in);

    initial begin
        clk = 0;
        forever 
            #50 clk = ~clk;
    end

    initial begin 
        reset = 1;
        #100 reset = 0;
        #100 reset = 1;
        #2500 $finish;
    end

    initial begin
        $display("SIM START");
        $monitor("clk = %d, reset = %d, p_count = %d, p_out = %d, op_code = %d, op_data = %d, reg0 = %d, reg1 = %d, reg2 = %d, reg3 = %d, reg4 = %d, reg5 = %d, reg6 = %d, reg7 = %d, n_reg_a = %d, reg_a = %d, n_reg_b = %d, reg_b = %d, reg_in = %d", clk, reset, p_count, p_out, op_code, op_data, reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, n_reg_a, reg_a, n_reg_b, reg_b,  reg_in);
        $dumpfile("cpu_sim.vcd");
        $dumpvars;
    end

endmodule