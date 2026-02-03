`define FT 2'b00
`define DC 2'b01
`define EX 2'b10
`define WB 2'b11

module state_machine_cpu(clk, reset, cs, ft_clk, dc_clk, ex_clk, wb_clk);
    input clk, reset;
    output reg[1:0] cs;
    output ft_clk, dc_clk, ex_clk, wb_clk;

    always @(posedge clk or negedge reset) begin
        if(!reset) cs <= `FT;
        else begin
            case(cs)
                `FT: cs <= `DC;
                `DC: cs <= `EX;
                `EX: cs <= `WB;
                `WB: cs <= `FT;
                default: cs <= 2'bxx;
            endcase
        end
    end

    assign ft_clk = (cs == `FT);
    assign dc_clk = (cs == `DC);
    assign ex_clk = (cs == `EX);
    assign wb_clk = (cs == `WB);
endmodule