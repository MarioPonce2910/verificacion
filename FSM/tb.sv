module tb_fsm(); // this module describe a testbench for the mealy FSM

    reg clk;
    reg reset;
    reg in_edge;
    wire out_edge;

edge_mealy edge_mealy_ins( // in this block of code i made a conection to the FSM
    .clk(clk),
    .reset(reset),
    .in_edge(in_edge),
    .out_edge(out_edge)
);
initial begin // and describe the CLK, reset and in_Edge inputs.
    #10
    clk = 1;
    reset = 1;
    #10
    clk = 0;
    reset = 0;
    #10
    clk = 1;
    in_edge = 1;
    #10
    clk = 0;
    in_edge = 1;
    #10
    clk = 1;
    in_edge = 1;
    #10
    clk = 0;
    in_edge = 1;
    #10
    clk = 1;
    in_edge = 1;
    #10
    clk = 0;
    in_edge = 1;
    #10
    clk = 1;
    in_edge = 1;
    #10
    clk = 0;
    in_edge = 1;
    #10
    clk = 1;
    in_edge = 0;
    #10
    clk = 0;
    in_edge = 0;
    #10
    clk = 1;
    in_edge = 1;
    #10
    clk = 0;
    in_edge = 1;
    #10
    clk = 1;
    in_edge = 0;
    #10
    clk = 0;
    in_edge = 0;

end


endmodule
module tb_fsm_moore();// this module describe a testbench for the mealy FSM 

    reg clk;
    reg reset;
    reg in_edge;
    wire out_edge;

edge_moore edge_moore_ins(// in this block of code i made a conection to the FSM
    .clk(clk),
    .reset(reset),
    .in_edge(in_edge),
    .out_edge(out_edge)
);
initial begin// and describe the CLK, reset and in_Edge inputs.
    #10
    clk = 1;
    reset = 1;
    #10
    clk = 0;
    reset = 0;
    #10
    clk = 1;
    in_edge = 1;
    #10
    clk = 0;
    in_edge = 1;
    #10
    clk = 1;
    in_edge = 0;
    #10
    clk = 0;
    in_edge = 0;
    #10
    clk = 1;
    in_edge = 1;
    #10
    clk = 0;
    in_edge = 1;
    #10
    clk = 1;
    in_edge = 0;
    #10
    clk = 0;
    in_edge = 0;

end


endmodule