module decode(clk_dc, p_out, op_code, op_data);
    input clk_dc;
    input [14:0] p_out;
    output reg [3:0] op_code;
    output reg [7:0] op_data;

    always @ (posedge clk_dc) begin
        op_code <= p_out[14:11];
        op_data <= p_out[7:0];
    end
    
endmodule