module multiplexer(a, b, c, f, s);
    input a, b, c;
    input[1:0] f;
    output reg s;

    always @(*) begin
        if(f == 2'b00)
            s = a;
        else if(f == 2'b01)
            s = b;
        else
            s = c;
    end

endmodule