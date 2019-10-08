module register_tb ();
    reg clk,reset,load,bit0,bit1,bit2,bit3;
    wire finish;
    wire tx;
    wire [2:0] count;
    wire [3:0] sender;

    register register_ins(
        .clk(clk),
        .reset(reset),
        .load(load),
        .bit0(bit0),
        .bit1(bit1),
        .bit2(bit2),
        .bit3(bit3),
        .finish(finish),
        .tx(tx),
        .count(count),
        .sender(sender)
    );
    always
        begin
            #5 clk = !clk;
        end
        initial begin
        clk = 0;
        reset = 1;
        load = 0;
        bit0 = 0;
        bit1 = 0;
        bit2 = 0;
        bit3 = 0;
        #5
        reset = 1;
        end
    initial begin
       reset = 1'b1;
       #5
       reset = 1'b0;
       load = 1'b1;
       #5
       bit0 = 1;
       bit1 = 0;
       bit2 = 1;
       bit3 = 0;
       #5
       load = 1'b0;
       #50
       reset = 1;
    end
endmodule