`timescale 1ns / 1ps
`include "4bits.sv"


module TB_01();

    bit clk;
    reg reset,load;
    reg [3:0] data_in;
    wire fn;
    wire tx;
    wire [4:0] counter;

    register register_ins(
        .clk(clk),
        .reset(reset),
        .load(load),
        .data_in(data_in),
        .fn(fn),
        .tx(tx),
        .counter(counter)
    );
    initial begin
        @(posedge clk);
        reset = 1'b1;
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        reset = 1'b0;
        @(posedge clk);
        #400
        data_in = 4;
        $stop;
    end

    always
        #30 clk = !clk;

    TB_02 TB (
        .clk(clk),
        .q(tx)
    );

endmodule : TB_01

program TB_02 #(byte size = 4) (input bit clk, input wire [3:0] q);

    typedef struct {
        reg [size] q;

    } data_counter_T1;
    data_counter_T1 show_counter;

    initial begin
    $monitor("struct: %p",show_counter);
    $display("program:");
    show_counter.q = q;
    $display("struct: %p",show_counter);
    @(posedge clk);
    @(posedge clk);
    show_counter.q = q;
    $display("struct: %p",show_counter);
    end
endprogram


