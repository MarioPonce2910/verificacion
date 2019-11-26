`timescale 1ns / 1ps
`include "exm.sv"


module memory_tb ();
    reg clk;
    reg rst;
    reg enable;
    reg [15:0] add;
    wire st_end;
    wire [7:0] write_tb;
    wire [7:0] add_tb;
    wire [2:0] fsm_tb;

    memory memory_tb(
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .add(add),
        .st_end(st_end),
        .write_tb(write_tb),
        .add_tb(add_tb),
        .fsm_tb(fsm_tb)
    );

    initial begin
        clk = 0;
    end

     always
        #5 clk = ~clk;


        initial begin
            rst = 0;
            #5
            rst = 1;
            #10
            rst = 0;
            #10
            $display("FSM : %b", fsm_tb);

            enable = 1;
            add = 16'h0010;
            #50

            $display("clk : %b", clk);
            $display("add_Wrire : %b", add_tb);
            $display("data_write : %b", write_tb);
            $display("end : %b", st_end);
            $display("FSM : %b", fsm_tb);

            
            #10
            $display("end : %b", st_end);

            add = 16'h0001;
            #50

            $display("clk : %b", clk);
            $display("add_Wrire : %b", add_tb);
            $display("data_write : %b", write_tb);
            $display("end : %b", st_end);
            $display("FSM : %b", fsm_tb);

            $stop;
        end

        // program_tb TB (
        // .clk(clk),
        // .rst(rst),
        // .enable(enable),
        // .add(add),
        // .st_end(st_end)
        // );
endmodule

// program program_tb (
//     input wire clk,
//     output reg rst, enable,
//     output reg [7:0] add,
//     input wire st_end
// );

// reg [7:0] i = 0;

// initial begin
//     repeat (1) begin
//         i = i+1;
//         enable = 1'b1;
//         wr = 1'b1;
//         data_in = 5 * i;
//         #5
//         $display("in : %p", data_in);
//         $display("out : %p" , data_out);
//         enable = 1'b1;
//         wr = 1'b0;
//         data_in = 5 * i;
//         #5
//         $display("in : %p", data_in);
//         $display("out : %p" , data_out);
//     end
// end


// endprogram