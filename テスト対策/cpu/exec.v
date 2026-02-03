`define MOV 4'b0000
`define ADD 4'b0001
`define SUB 4'b0010
`define LDL 4'b0011
`define LDH 4'b0100

module exec(clk_ex, reset, op_code, reg_a, reg_b, op_data, p_count, reg_in);
    input clk_ex, reset;
    input [3:0] op_code;
    input [15:0] reg_a, reg_b;
    input [7:0] op_data;

    output reg [7:0] p_count;
    output reg [15:0] reg_in;

    always @ (posedge clk_ex or negedge reset)
        if(!reset) p_count <= 0;
        else
            case (op_code)
                `MOV:
                    begin
                        reg_in <= reg_b;
                        p_count <= p_count + 1;
                    end
                `ADD:
                    begin
                        reg_in <= reg_a + reg_b;
                        p_count <= p_count + 1;
                    end
                `SUB:
                    begin
                        reg_in <= reg_a - reg_b;
                        p_count <= p_count + 1;
                    end
                `LDL:
                    begin
                        reg_in <= {reg_a[15:8], op_data};
                        p_count <= p_count + 1;
                    end
                `LDH:
                    begin
                        reg_in <= {op_data, reg_a[7:0]};
                        p_count <= p_count + 1;
                    end
            endcase
endmodule