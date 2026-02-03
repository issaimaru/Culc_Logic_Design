module memory(addr, d, load, clk, q);
    parameter ADDRWIDTH = 12, DATAWIDTH = 16, WORDS = 4096;
    input clk, load;
    input [ADDRWIDTH - 1:0] addr;
    input [DATAWIDTH - 1:0] d;
    output [DATAWIDTH - 1:0] q;
    reg [DATAWIDTH - 1:0] q;
    reg [DATAWIDTH - 1:0] mem [WORDS - 1:0];

    always @(posedge clk)
        if(load) mem[addr] <= d;
        q <= mem[addr];
endmodule