module reg_wb(clk_wb, reset, n_reg, reg_in, reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7);
    input clk_wb, reset;
    input [2:0] n_reg;
    input [15:0] reg_in;
    output reg [15:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7;

    always @ (posedge clk_wb)
        if(!reset) begin
            reg0 <= 16'h0000;
            reg1 <= 16'h0000;
            reg2 <= 16'h0000;
            reg3 <= 16'h0000;
            reg4 <= 16'h0000;
            reg5 <= 16'h0000;
            reg6 <= 16'h0000;
            reg7 <= 16'h0000;
        end
        else begin
            case (n_reg)
                0: reg0 <= reg_in;
                1: reg1 <= reg_in;
                2: reg2 <= reg_in;
                3: reg3 <= reg_in;
                4: reg4 <= reg_in;
                5: reg5 <= reg_in;
                6: reg6 <= reg_in;
                7: reg7 <= reg_in;
                default:
                    begin
                        reg0 <= 16'hxxxx;
                        reg1 <= 16'hxxxx;
                        reg2 <= 16'hxxxx;
                        reg3 <= 16'hxxxx;
                        reg4 <= 16'hxxxx;
                        reg5 <= 16'hxxxx;
                        reg6 <= 16'hxxxx;
                        reg7 <= 16'hxxxx;
                    end
            endcase
        end

endmodule