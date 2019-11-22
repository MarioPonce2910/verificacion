`timescale 1ns / 1ps
`include "ex.sv"


module tb ();
    reg clk, inv, ce, rest;
    reg [15:0] data_in;
    wire [15:0] data_out;

    exam exam_tb(
        .clk(clk),
        .inv(inv),
        .ce(ce),
        .rest(rest),
        .data_in(data_in),
        .data_out(data_out)
    );

    initial begin
        clk = 0;
        #5
        rest = 1;
        #5
        rest = 0;
        data_in = 0;
        inv = 0;
        ce = 0;
    end

     always
        begin
        #5 clk = ~clk;
        end
    initial 
        begin
        data_in = 16'b1111000011110000;
        #5
        ce = 1;
        #20
        ce = 0;
        #20
        inv = 1; 
    end

endmodule

