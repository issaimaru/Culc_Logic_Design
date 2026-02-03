module prom(clk, addr, q);
    input clk;
    input [7:0] addr;
    output reg [14:0] q;
    reg [14:0] mem [255:0];

    always @ (posedge clk)
        begin
            q <= mem[addr];
        end
    
    initial begin
        mem[0] = 15'b010000000000000;
        mem[1] = 15'b001100000000001;
        mem[2] = 15'b010000100000000;
        mem[3] = 15'b001100100000010;
        mem[4] = 15'b000100000100000;
    end
endmodule