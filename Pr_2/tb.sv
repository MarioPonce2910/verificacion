`timescale 1ns / 1ps
`include "8b.sv"
`include "16b.sv"
`include "fsm.sv"


module memory_tb ();
    reg [15:0] address;
    reg [15:0] data_in; 
    reg enable;
    reg clk;
    wire [15:0] data_out;
    wire [7:0] data_write_8b;
    wire [7:0] data_addres_8b;

    memory memory(
        .data_out(data_out),
        .address(address),
        .data_in(data_in),
        .enable(enable),
        .clk(clk),
        .data_write_8b(data_write_8b),
        .data_addres_8b(data_addres_8b)
    );

    initial begin
        clk = 0;
    end

     always
        #5 clk = ~clk;
    
    program_tb TB (
        .address(address),
        .data_in(data_in), 
        .enable(enable),
        .clk(clk),
        .data_out(data_out),
        .data_write_8b(data_write_8b),
        .data_addres_8b(data_addres_8b)
        );

        
endmodule

program program_tb (
    output reg [15:0] address,
    output reg [15:0] data_in, 
    input wire clk,
    output reg enable,
    input wire [15:0]data_out,
    input wire [7:0]data_write_8b,
    input wire [7:0]data_addres_8b
);

    reg [15:0] x = 0;

    initial begin

            repeat(65536) begin
            enable = 0;
            #20
            address = x;
            data_in = x;
            x=x+1;
            end
            for (int i = 0;i<5 ;i++ ) begin

            #20
            enable = 1;
            address = i*900;

            #20
            $display("data_out_16b : %b",data_out);
            $display("data_in_8b : %b",data_write_8b);
            $display("address8b : %b",data_addres_8b);

            address = i+5;
            #20
            $display("data_out_16b : %b",data_out);
            $display("data_in_8b : %b",data_write_8b);
            $display("address8b : %b",data_addres_8b);
                
            end
            

            $stop;
        end




endprogram

