`timescale 1ns / 1ps
`include "memory.sv"


module register_tb ();
    reg clk, rst, wr, enable;
    reg [7:0] add;
    reg [7:0] data_in;
    wire [7:0] data_out;

    register memory_tb(
        .clk(clk),
        .rst(rst),
        .wr(wr),
        .enable(enable),
        .add(add),
        .data_in(data_in),
        .data_out(data_out)
    );

    initial begin
        clk = 0;
    end

     always
        #5 clk = ~clk;

        program_tb TB (
        .clk(clk),
        .rst(rst),
        .wr(wr),
        .enable(enable),
        .add(add),
        .data_in(data_in),
        .data_out(data_out)
        );
endmodule

program program_tb (
    input wire clk,
    output reg rst, wr, enable,
    output reg [7:0] add,
    output reg [7:0] data_in,
    output wire [7:0] data_out
);

reg [7:0] i = 0;

initial begin
    repeat (1) begin
        i = i+1;
        enable = 1'b1;
        wr = 1'b1;
        data_in = 5 * i;
        #5
        $display("in : %p", data_in);
        $display("out : %p" , data_out);
        enable = 1'b1;
        wr = 1'b0;
        data_in = 5 * i;
        #5
        $display("in : %p", data_in);
        $display("out : %p" , data_out);
    end
end


endprogram