module fsm(
    input wire clk, rst, enable,
    input wire [15:0] add,
    input wire [15:0] data_in,
    output reg st_end,

    output reg [15:0] dataread_tb,
    output reg [2:0] st_fsm_tb,
    input wire [15:0] add_test,
    input wire [15:0] data_in_test,
    output wire [7:0] rw_tb,

    input wire [7:0] data_out_tb
);

    reg [2:0] st_fsm = 0;
    reg [15:0] rw16b;
    reg [15:0] add16b;
    reg [15:0] dataread;

    reg [7:0] data_8b1;
    reg [7:0] data_8b2;
    reg  rw8b;


    memory16b memory16b(
        .clk(clk),
        .add(add),
        .data_in(data_in),
        .rw(rw16b),
        .data_out(dataread),
        .add_test(add_test),
        .data_in_test(data_in_test),
        .rw_tb(rw_tb)
    );
    memory8b memory8b(
        .clk(clk),
        .add(data_8b1),
        .rw(rw8b),
        .data_in(data_8b2),
        .data_out_tb(data_out_tb)
    );




always@(*)
    begin
        if (rst) begin
          st_fsm_tb = 0;
        end
    end

always@(posedge clk)
    begin
        if (enable) begin
            if (st_fsm == 0) begin
              rw16b = 1;
              st_fsm_tb = st_fsm;
              st_fsm = 1;
            end
            if (st_fsm == 1) begin
                data_8b1 = dataread[15:8];
                data_8b2 = dataread[7:0];
                rw8b = 0;
                st_fsm_tb = st_fsm;
              st_fsm = 2;
            end
            if (st_fsm == 2) begin
                st_fsm_tb = st_fsm;
              st_fsm = 0;
            end
        end
    end
    always@(posedge clk)
    begin
        if (!enable) begin
            rw16b = 0;
            st_fsm = 0;
            st_fsm_tb = st_fsm;
        end
    end
endmodule 