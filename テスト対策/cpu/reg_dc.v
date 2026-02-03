module reg_dc(clk_dc, n_reg_in, reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, n_reg_out, reg_out);
    input clk_dc;
    input [2:0] n_reg_in;
    input [15:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7;

    output reg [2:0] n_reg_out;
    output reg [15:0] reg_out;

    always @ (posedge clk_dc) begin
        case (n_reg_in)
            3'b000: reg_out <= reg0;
            3'b001: reg_out <= reg1;
            3'b010: reg_out <= reg2;
            3'b011: reg_out <= reg3;
            3'b100: reg_out <= reg4;
            3'b101: reg_out <= reg5;
            3'b110: reg_out <= reg6;
            3'b111: reg_out <= reg7;
            default: reg_out <= 15'bxxxxxxxxxxxxxxx;
        endcase
        n_reg_out <= n_reg_in;
    end

endmodule