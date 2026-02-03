module counter(clk, reset, count);
    input clk, reset;
    output reg [3:0] count;

    always @ (posedge clk or negedge reset)
        if(!reset)
            q <= 0;
        else
            q <= d;
endmodule