module memory(addr, d, load, clk, q);
    input clk, load;
    input [11:0] addr;
    input [15:0] d;
    output [15:0] q;
    reg [15:0] q;
    reg [15:0] mem [4095:0];

    always @(posedge clk)
        if(load) mem[addr] <= d;
        q <= mem[addr];
endmodule