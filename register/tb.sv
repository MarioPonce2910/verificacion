module register_tb ();
    reg clk,reset,load;
    reg [3:0] data_in;
    wire fn;
    wire tx;

    register register_ins(
        .clk(clk),
        .reset(reset),
        .load(load),
        .data_in(data_in),
        .fn(fn),
        .tx(tx)
    );
    always
        begin
            #5 clk = !clk;
        end
        initial begin
        clk = 0;
        reset = 1;
        load = 0;
        data_in = 0;
        #5
        reset = 1;
        end
    initial begin
       reset = 1'b1;
       #5
       reset = 1'b0;
       load = 1'b1;
       #5
        data_in[0] = 0;
        data_in[1] = 1;
        data_in[2] = 1;
        data_in[3] = 0;
       #5
       load = 1'b0;
       #50
       reset = 1;
    end
endmodule