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
    end

     always
        #5 clk = ~clk;    

   
   program_tb TB (
        .clk(clk),
        .inv(inv),
        .ce(ce),
        .rest(rest),
        .data_in(data_in),
        .data_out(data_out)
        );

endmodule

program program_tb (
    output reg inv, ce, rest,
    output reg [15:0] data_in,
    input wire [15:0] data_out,
    input wire clk
);
reg [15:0] i = 0;
reg [4:0] x = 1;

 
// initial begin
//         #5
//         rest = 1;
//         #5
//         rest = 0;
//         data_in = 0;
//         inv = 0;
//         ce = 0;
//     // $monitor("out : %b" , data_out);
//     // $monitor("in : %b" , data_in);
//     // $monitor("INV : %b" , inv);
//     // $monitor("clk : %b", clk);
//     // $monitor("ce : %b", ce);
    
    
//     repeat (1) begin
//         for (i = 0;i<10 ;i++) begin
//         #5
//         data_in = i * 10;
//         #10
//         ce = 1;
//         #10
//         ce = 0;
//         #10
//         inv = 1;
//         $display("out : %b" , data_out);
//         #10
//         inv = 0;
//         $display("out : %b" , data_out);
//         end      
//     end
// end
initial begin
        #5
        data_in = valo(0);
        #10
        ce = 1;
        #10
        ce = 0;
        #10
        inv = 1;
        $display("out : %b" , data_out);
        #10
        inv = 0;
        $display("out : %b" , data_out); 
end

function int valo(input int a);
    valo = a;
    
endfunction


endprogram
