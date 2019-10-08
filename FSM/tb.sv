module tb_fsm();

    reg clk;
    reg reset;
    reg in_edge;
    wire out_edge;

edge_mealy edge_mealy_ins(
    .clk(clk),
    .reset(reset),
    .in_edge(in_edge),
    .out_edge(out_edge)
);
initial begin
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
module tb_fsm();

    reg clk;
    reg reset;
    reg in_edge;
    wire out_edge;

edge_moore edge_moore_ins(
    .clk(clk),
    .reset(reset),
    .in_edge(in_edge),
    .out_edge(out_edge)
);
initial begin
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