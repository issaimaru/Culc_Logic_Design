`define IDLE 2'b00
`define FETCH 2'b01
`define EXEC 2'b10

module state_machine(clk, run, halt, reset, cs);
    input clk, run, halt, reset;
    output reg [1:0] cs;

    always @(posedge clk or negedge reset)
        if(!reset)
            cs <= `IDLE;
        else begin
            case(cs)
                `IDLE : if(run) cs <= `FETCH;
                `FETCH : cs <= `EXEC;
                `EXEC : if(halt) cs <= `IDLE; else cs <= `FETCH;
            endcase
        end
endmodule