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
    input wire clk, rst, wr, enable,
    output wire [7:0] add,
    output wire [7:0] data_in,
    output reg [7:0] data_out
);

reg [7:0] i;
initial begin
    $monitor("out : %p" , data_out);
    repeat (20) begin
        i = i + 1;
        #5
        data_out = 10;
        $display("clk : %p", clk);
        $display("counter : %p", i);
    end
end


endprogram