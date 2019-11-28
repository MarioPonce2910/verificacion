`timescale 1ns / 1ps
`include "fsm.sv"
`include "memory16b.sv"
`include "memory8b.sv"


module fsm_tb ();
    reg clk;
    reg rst;
    reg enable;
    reg [15:0] add;
    reg [15:0] data_in;
    wire st_end;
    wire [15:0] dataread_tb;
    wire [2:0] st_fsm_tb;
    wire [15:0] add_test;
    wire [15:0] data_in_test;
    wire rw_tb;

    wire [7:0] data_out_tb;

    fsm fsm_tb(
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .data_in(data_in),
        .add(add),
        .st_end(st_end),
        .dataread_tb(dataread_tb),
        .st_fsm_tb(st_fsm_tb),
        .add_test(add_test),
        .data_in_test(data_in_test),
        .rw_tb(rw_tb),
        .data_out_tb(data_out_tb)
    );

    initial begin
        clk = 0;
    end

     always
        #5 clk = ~clk;


        program_tb TB (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .data_in(data_in),
        .add(add),
        .st_end(st_end),
        .dataread_tb(dataread_tb),
        .st_fsm_tb(st_fsm_tb),
        .add_test(add_test),
        .data_in_test(data_in_test),
        .rw_tb(rw_tb),
        .data_out_tb(data_out_tb)
        );
endmodule

program program_tb (
    input wire clk,
    output reg rst, enable,
    output reg [15:0] data_in,
    output reg [15:0] add,
    input wire st_end,
    input wire [15:0] dataread_tb,
    input wire [2:0] st_fsm_tb,
    input wire [15:0] add_test,
    input wire [15:0] data_in_test,
    input wire rw_tb,

    input wire [7:0] data_out_tb
);
    reg [15:0] x = 0;

    initial begin
            enable = 0;
            #20
            repeat(65536) begin
                x = x+1;
                #20
                enable = 0;
                add = x;
                data_in = x;
            end
            
            $display("data in : %b", data_in_test);
            enable = 1;
            #20
            add = 16'h0010;
            #20
            enable = 0;
            #20
            $display("data read : %b", dataread_tb);
            $display("rw : %b", rw_tb);
            // enable = 1;
            // #20
            $display("data read : %b", dataread_tb);
            $display("output : %b",data_out_tb);
            $display("FSM : %b", st_fsm_tb);
            // $display("clk : %b", clk);
            // $display("ADD : %b", add_test);
            // $display("data read : %b", dataread_tb);
            // $display("data in : %b", data_in_test);
            // $display("FSM : %b", st_fsm_tb);
    

            $stop;
        end




endprogram