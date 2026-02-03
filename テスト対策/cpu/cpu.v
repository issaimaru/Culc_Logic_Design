module cpu(clk, reset, clk_ft, clk_dc, clk_ex, clk_wb, p_count, p_out, op_code, op_data, reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, n_reg_a, reg_a, n_reg_b, reg_b, reg_in);
    input clk, reset;
    wire [1:0] cs;
    output clk_ft, clk_dc, clk_ex, clk_wb;
    output [7:0] p_count, op_data;
    output [14:0] p_out;
    output [3:0] op_code;
    output [15:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7;
    output [2:0] n_reg_a, n_reg_b;
    output [15:0] reg_a, reg_b, reg_in;

    state_machine_cpu s_m_c(clk, reset, cs, clk_ft, clk_dc, clk_ex, clk_wb);
    fetch fetch_module(clk_ft, p_count, p_out);
    decode decode_module(clk_dc, p_out, op_code, op_data);
    reg_dc regA_dc(clk_dc, p_out[10:8], reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, n_reg_a, reg_a);
    reg_dc regB_dc(clk_dc, p_out[7:5], reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, n_reg_b, reg_b);
    exec exec_module(clk_ex, reset, op_code, reg_a, reg_b, op_data, p_count, reg_in);
    reg_wb reg_wb_module(clk_wb, reset, n_reg_a, reg_in, reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7);

endmodule