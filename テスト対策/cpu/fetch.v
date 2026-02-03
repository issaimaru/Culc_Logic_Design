module fetch(clk_ft, p_count, p_out);
    input clk_ft;
    input [7:0] p_count;
    output [14:0] p_out;

    prom pr(clk_ft, p_count, p_out);

endmodule